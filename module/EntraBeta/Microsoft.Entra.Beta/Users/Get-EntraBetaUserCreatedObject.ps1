# ------------------------------------------------------------------------------ 
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  
#  Licensed under the MIT License.  See License in the project root for license information. 
# ------------------------------------------------------------------------------ 
function Get-EntraBetaUserCreatedObject {
    [CmdletBinding(DefaultParameterSetName = 'GetQuery')]
    param (
        [Parameter(ParameterSetName = "GetQuery", ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = "The maximum number of items to return.")]
        [Alias("Limit")]
        [System.Nullable`1[System.Int32]] $Top,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = "The unique identifier for the user (User Principal Name or UserId).")]
        [Alias('ObjectId', 'UPN', 'Identity', 'UserPrincipalName')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
                if ($_ -match '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' -or 
                    $_ -match '^[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}$') {
                    return $true
                }
                throw "UserId must be a valid email address or GUID."
            })]
        [System.String] $UserId,

        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = "Return all items.")]
        [switch] $All,

        [Parameter(Mandatory = $false, ValueFromPipeline = $false, ValueFromPipelineByPropertyName = $true, HelpMessage = "The properties to include in the response.")]
        [Alias("Select")]
        [System.String[]] $Property
    )

    begin {
        # Ensure connection to Microsoft Entra
        if (-not (Get-EntraContext)) {
            $errorMessage = "Not connected to Microsoft Graph. Use 'Connect-Entra -Scopes User.Read.All' to authenticate."
            Write-Error -Message $errorMessage -ErrorAction Stop
            return
        }
    }
    
    PROCESS {    
        $params = @{}
        $customHeaders = New-EntraBetaCustomHeaders -Command $MyInvocation.MyCommand        
        if ($PSBoundParameters.ContainsKey("Verbose")) {
            $params["Verbose"] = $PSBoundParameters["Verbose"]
        }
        if ($null -ne $PSBoundParameters["UserId"]) {
            $params["UserId"] = $PSBoundParameters["UserId"]
        }
        if ($null -ne $PSBoundParameters["All"]) {
            if ($PSBoundParameters["All"]) {
                $params["All"] = $PSBoundParameters["All"]
            }
        }
        if ($PSBoundParameters.ContainsKey("Debug")) {
            $params["Debug"] = $PSBoundParameters["Debug"]
        }
        if ($PSBoundParameters.ContainsKey("Top")) {
            $params["Top"] = $PSBoundParameters["Top"]
        }
        if ($null -ne $PSBoundParameters["WarningVariable"]) {
            $params["WarningVariable"] = $PSBoundParameters["WarningVariable"]
        }
        if ($null -ne $PSBoundParameters["InformationVariable"]) {
            $params["InformationVariable"] = $PSBoundParameters["InformationVariable"]
        }
        if ($null -ne $PSBoundParameters["InformationAction"]) {
            $params["InformationAction"] = $PSBoundParameters["InformationAction"]
        }
        if ($null -ne $PSBoundParameters["OutVariable"]) {
            $params["OutVariable"] = $PSBoundParameters["OutVariable"]
        }
        if ($null -ne $PSBoundParameters["OutBuffer"]) {
            $params["OutBuffer"] = $PSBoundParameters["OutBuffer"]
        }
        if ($null -ne $PSBoundParameters["ErrorVariable"]) {
            $params["ErrorVariable"] = $PSBoundParameters["ErrorVariable"]
        }
        if ($null -ne $PSBoundParameters["PipelineVariable"]) {
            $params["PipelineVariable"] = $PSBoundParameters["PipelineVariable"]
        }
        if ($null -ne $PSBoundParameters["ErrorAction"]) {
            $params["ErrorAction"] = $PSBoundParameters["ErrorAction"]
        }
        if ($null -ne $PSBoundParameters["WarningAction"]) {
            $params["WarningAction"] = $PSBoundParameters["WarningAction"]
        }
        if ($null -ne $PSBoundParameters["Property"]) {
            $params["Property"] = $PSBoundParameters["Property"]
        }
    
        Write-Debug("============================ TRANSFORMATIONS ============================")
        $params.Keys | ForEach-Object { "$_ : $($params[$_])" } | Write-Debug
        Write-Debug("=========================================================================`n")
        
        $response = Get-MgBetaUserCreatedObject @params -Headers $customHeaders
        $properties = @{
            ObjectId          = "Id"
            DeletionTimestamp = "deletedDateTime"
            AppOwnerTenantId  = "appOwnerOrganizationId"
        }
        $response | ForEach-Object {
            if ($null -ne $_) {
                Add-Member -InputObject $_ -NotePropertyMembers $_.AdditionalProperties 
                foreach ($prop in $properties.GetEnumerator()) {
                    $propertyName = $prop.Name
                    $propertyValue = $prop.Value
                    if ($_.PSObject.Properties.Match($propertyName)) {
                        $_ | Add-Member -MemberType AliasProperty -Name $propertyName -Value $propertyValue
                    }
                }
                $propsToConvert = @('keyCredentials', 'passwordCredentials', 'requiredResourceAccess')
                foreach ($prop in $propsToConvert) {
                    try {
                        if ($_.PSObject.Properties.Match($prop)) {
                            $value = $_.$prop | ConvertTo-Json -Depth 10 | ConvertFrom-Json
                            $_ | Add-Member -MemberType NoteProperty -Name $prop -Value ($value) -Force   
                        }
                    }
                    catch {}    
                }
            }
        }
        $response
    }    
}

