# ------------------------------------------------------------------------------
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
# ------------------------------------------------------------------------------
@{
    SourceName = "Remove-AzureADMSDeletedDirectoryObject"
    TargetName = $null
    Parameters = $null
    Outputs = $null
    CustomScript = @'
    PROCESS {  
        $params = @{}
        $Method = "DELETE"
        $customHeaders = New-EntraCustomHeaders -Command $MyInvocation.MyCommand
        if ($null -ne $PSBoundParameters["Id"]) {
            $params["Id"] = $PSBoundParameters["Id"]
        }        
        Write-Debug("============================ TRANSFORMATIONS ============================")
        $params.Keys | ForEach-Object {"$_ : $($params[$_])" } | Write-Debug
        Write-Debug("=========================================================================`n")
        $URI = "https://graph.microsoft.com/v1.0/directory/deletedItems/$Id"
        $response = Invoke-GraphRequest -Headers $customHeaders -Uri $uri -Method $Method
        $response
    }
'@
}