# ------------------------------------------------------------------------------
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
# ------------------------------------------------------------------------------
BeforeAll {
    if ((Get-Module -Name Microsoft.Entra.Groups) -eq $null) {
        Import-Module Microsoft.Entra.Groups
    }
    Import-Module (Join-Path $PSScriptRoot "..\..\Common-Functions.ps1") -Force

    $scriptblock = {
        return @(
            [PSCustomObject]@{
                "Id"         = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
                "Parameters" = $args
            }
        )
    }  
    $scriptblock2 = {
        # Write-Host "Mocking Get-EntraGroup with parameters: $($args | ConvertTo-Json -Depth 3)"
        return @(
            [PSCustomObject]@{
                "DisplayName"     = "demo"
                "Id"              = "bbbbbbbb-1111-2222-3333-cccccccccccc"
                "MailEnabled"     = "False"
                "Description"     = "test"
                "MailNickname"    = "demoNickname"
                "SecurityEnabled" = "True"
                "Parameters"      = $args
            }
        )
    }
    Mock -CommandName Get-MgGroupMemberOf -MockWith $scriptblock -ModuleName Microsoft.Entra.Groups
    Mock -CommandName Get-MgGroup -MockWith $scriptblock2 -ModuleName Microsoft.Entra.Groups
}

Describe "Select-EntraGroupIdsGroupIsMemberOf" {
    Context "Test for Select-EntraGroupIdsGroupIsMemberOf" {
        It "Should return specific Group Membership" {
            $Groups = New-Object Microsoft.Open.AzureAD.Model.GroupIdsForMembershipCheck
            $Groups.GroupIds = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            $GroupID = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            $result = Select-EntraGroupIdsGroupIsMemberOf -GroupId $GroupID -GroupIdsForMembershipCheck $Groups
            $result | Should -Not -BeNullOrEmpty
            $result | Should -Be '00aa00aa-bb11-cc22-dd33-44ee44ee44ee'

            Should -Invoke -CommandName Get-MgGroupMemberOf -ModuleName Microsoft.Entra.Groups -Times 1
        }

        It "Should fail when GroupId is missing" {
            $Groups = New-Object Microsoft.Open.AzureAD.Model.GroupIdsForMembershipCheck
            $Groups.GroupIds = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            { Select-EntraGroupIdsGroupIsMemberOf -GroupId -GroupIdsForMembershipCheck $Groups } | Should -Throw "Missing an argument for parameter 'GroupId'*"
        }

        It "Should fail when GroupId is empty" {
            $Groups = New-Object Microsoft.Open.AzureAD.Model.GroupIdsForMembershipCheck
            $Groups.GroupIds = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            { Select-EntraGroupIdsGroupIsMemberOf -GroupId "" -GroupIdsForMembershipCheck $Groups } | Should -Throw "Cannot bind argument to parameter 'GroupId' because it is an empty string."
        }

        It "Should fail when GroupIdsForMembershipCheck is empty" {
            $GroupID = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            { Select-EntraGroupIdsGroupIsMemberOf -GroupId $GroupID -GroupIdsForMembershipCheck } | Should -Throw "Missing an argument for parameter 'GroupIdsForMembershipCheck'*"
        }

        It "Should fail when GroupIdsForMembershipCheck is invalid" {
            $GroupID = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            { Select-EntraGroupIdsGroupIsMemberOf -GroupId $GroupID -GroupIdsForMembershipCheck "Xy" } | Should -Throw "Cannot process argument transformation on parameter 'GroupIdsForMembershipCheck'.*"
        }
        It "Should contain 'User-Agent' header" {
            $userAgentHeaderValue = "PowerShell/$psVersion EntraPowershell/$entraVersion Select-EntraGroupIdsGroupIsMemberOf"
            $Groups = New-Object Microsoft.Open.AzureAD.Model.GroupIdsForMembershipCheck
            $Groups.GroupIds = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            $GroupID = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"

            Select-EntraGroupIdsGroupIsMemberOf -GroupId $GroupID -GroupIdsForMembershipCheck $Groups

            $userAgentHeaderValue = "PowerShell/$psVersion EntraPowershell/$entraVersion Select-EntraGroupIdsGroupIsMemberOf"

            Should -Invoke -CommandName Get-MgGroupMemberOf -ModuleName Microsoft.Entra.Groups -Times 1 -ParameterFilter {
                $Headers.'User-Agent' | Should -Be $userAgentHeaderValue
                $true
            }
        } 
        It "Should execute successfully without throwing an error" {
            # Disable confirmation prompts       
            $originalDebugPreference = $DebugPreference
            $DebugPreference = 'Continue'
            $Groups = New-Object Microsoft.Open.AzureAD.Model.GroupIdsForMembershipCheck
            $Groups.GroupIds = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"
            $GroupID = "00aa00aa-bb11-cc22-dd33-44ee44ee44ee"

            try {
                # Act & Assert: Ensure the function doesn't throw an exception
                { Select-EntraGroupIdsGroupIsMemberOf -GroupId $GroupID -GroupIdsForMembershipCheck $Groups -Debug } | Should -Not -Throw
            }
            finally {
                # Restore original confirmation preference            
                $DebugPreference = $originalDebugPreference        
            }
        } 
    }
}

