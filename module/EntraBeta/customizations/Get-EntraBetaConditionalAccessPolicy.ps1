# ------------------------------------------------------------------------------
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
# ------------------------------------------------------------------------------
@{
    SourceName = "Get-AzureADMSConditionalAccessPolicy"
    TargetName = "Get-MgBetaIdentityConditionalAccessPolicy"
    Parameters = @(
        @{
            SourceName = "PolicyId"
            TargetName = "ConditionalAccessPolicyId"
            ConversionType = "Name"
            SpecialMapping = $null
        }
    )
    Outputs = $null
}