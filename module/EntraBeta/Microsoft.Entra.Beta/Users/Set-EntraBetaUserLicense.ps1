# ------------------------------------------------------------------------------ 
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  
#  Licensed under the MIT License.  See License in the project root for license information. 
# ------------------------------------------------------------------------------ 
function Set-EntraBetaUserLicense {
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (                
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Microsoft.Open.AzureAD.Model.AssignedLicenses] $AssignedLicenses,
                
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias("ObjectId")]
        [System.String] $UserId
    )

    PROCESS {    
        $params = @{}
        $customHeaders = New-EntraBetaCustomHeaders -Command $MyInvocation.MyCommand
        if ($null -ne $PSBoundParameters["UserId"]) {
            $params["UserId"] = $PSBoundParameters["UserId"]
            $UserId = $PSBoundParameters["UserId"]
        }
        $jsonBody = @{
            addLicenses    = @(if ($PSBoundParameters.AssignedLicenses.AddLicenses) {
                    $PSBoundParameters.AssignedLicenses.AddLicenses | Select-Object @{Name = 'skuId'; Expression = { $_.'skuId' -replace 's', 's'.ToLower() } }
                }
                else {
                    @()
                })
            removeLicenses = @(if ($PSBoundParameters.AssignedLicenses.RemoveLicenses) {
                    $PSBoundParameters.AssignedLicenses.RemoveLicenses
                }
                else {
                    @()
                })
        } | ConvertTo-Json
        
        $customHeaders['Content-Type'] = 'application/json'

        $graphApiEndpoint = "/beta/users/$UserId/microsoft.graph.assignLicense"  
        Write-Debug("============================ TRANSFORMATIONS ============================")
        $params.Keys | ForEach-Object { "$_ : $($params[$_])" } | Write-Debug
        Write-Debug("=========================================================================`n")
        
        $response = Invoke-GraphRequest -Headers $customHeaders -Uri $graphApiEndpoint -Method Post -Body $jsonBody

        $response | ForEach-Object {
            if ($null -ne $_) {
                Add-Member -InputObject $_ -MemberType AliasProperty -Name ObjectId -Value Id
            }
        }
        $response
    }      
}

