---
author: msewaweru
description: This article provides details on the Get-EntraSubscribedSku command.
external help file: Microsoft.Entra.DirectoryManagement-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Get-EntraSubscribedSku
schema: 2.0.0
title: Get-EntraSubscribedSku
---

# Get-EntraSubscribedSku

## SYNOPSIS

Gets subscribed SKUs to Microsoft services.

## SYNTAX

### GetQuery (Default)

```powershell
Get-EntraSubscribedSku
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetById

```powershell
Get-EntraSubscribedSku
 -SubscribedSkuId <String>
 [-Property <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION

The `Get-EntraSubscribedSku` cmdlet gets subscribed SKUs to Microsoft services.

In delegated scenarios with work or school accounts, when acting on another user, the signed-in user must have a supported Microsoft Entra role or a custom role with the necessary permissions. The following least privileged roles support this operation:

- Dynamics 365 Business Central Administrator (read-only access to standard properties)
- Global Reader
- Directory Readers

## EXAMPLES

### Example 1: Get subscribed SKUs

```powershell
Connect-Entra -Scopes 'Organization.Read.All', 'LicenseAssignment.Read.All'
Get-EntraSubscribedSku
```

```Output
Id                                                                        AccountId                            AccountName   AppliesTo CapabilityStatus ConsumedUnits SkuId                                SkuPartNumber
--                                                                        ---------                            -----------   --------- ---------------- ------------- -----                                -------
aaaa0000-bb11-2222-33cc-444444dddddd 0000aaaa-11bb-cccc-dd22-eeeeee333333 M365x99297270 User      Enabled          20            aaaaaaaa-0b0b-1c1c-2d2d-333333333333 EMSP...
bbbb1111-cc22-3333-44dd-555555eeeeee 1111bbbb-22cc-dddd-ee33-ffffff444444 M365x99297270 User      Enabled          20            bbbbbbbb-1c1c-2d2d-3e3e-444444444444 ENTE...
cccc2222-dd33-4444-55ee-666666ffffff 2222cccc-33dd-eeee-ff44-aaaaaa555555 M365x99297270 User      Enabled          2             cccccccc-2d2d-3e3e-4f4f-555555555555 ENTE...
```

This example demonstrates how to retrieve subscribed SKUs to Microsoft services.

### Example 2: Get subscribed SKUs by SubscribedSkuId

```powershell
Connect-Entra -Scopes 'Organization.Read.All', 'LicenseAssignment.Read.All'
Get-EntraSubscribedSku -SubscribedSkuId 'abcdefgh-1111-2222-bbbb-cccc33333333_dddddddd-4444-5555-eeee-666666666666'
```

```Output
Id                                                                        AccountId                            AccountName   AppliesTo CapabilityStatus ConsumedUnits SkuId                                SkuPartNumber
--                                                                        ---------                            -----------   --------- ---------------- ------------- -----                                -------
aaaa0000-bb11-2222-33cc-444444dddddd 0000aaaa-11bb-cccc-dd22-eeeeee333333 M365x99297270 User      Enabled          20            aaaaaaaa-0b0b-1c1c-2d2d-333333333333 EMSP...
```

This example demonstrates how to retrieve specified subscribed SKUs to Microsoft services.

- `-SubscribedSkuId` parameter specifies the ID of the SKU (Stock Keeping Unit).

### Example 3: Get available license plans

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All', 'Organization.Read.All', 'LicenseAssignment.Read.All'
Get-EntraSubscribedSku | Select-Object -Property Sku*, ConsumedUnits -ExpandProperty PrepaidUnits
```

```Output
Enabled              : 5
LockedOut            : 0
Suspended            : 0
Warning              : 0
AdditionalProperties :
SkuId                : efccb6f7-5641-4e0e-bd10-b4976e1bf68e
SkuPartNumber        : EMS
ConsumedUnits        : 3
```

This example demonstrates how to retrieve available license plans.

### Example 4: Retrieve all users assigned a specific license

```powershell
Connect-Entra -Scopes 'Organization.Read.All', 'LicenseAssignment.Read.All'
$sku = Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'DEVELOPERPACK_E5' }
$skuId = $sku.SkuId
$usersWithDeveloperPackE5 = Get-EntraUser -All | Where-Object {
    $_.AssignedLicenses -and ($_.AssignedLicenses.SkuId -contains $skuId)
}
$usersWithDeveloperPackE5 | Select-Object Id, DisplayName, UserPrincipalName, AccountEnabled, UserType | Format-Table -AutoSize
```

```Output
Id                                   DisplayName     UserPrincipalName               AccountEnabled   UserType
--                                   -----------     -----------------               --------------   --------
cccccccc-2222-3333-4444-dddddddddddd  Angel Brown    AngelB@contoso.com              True             Member
dddddddd-3333-4444-5555-eeeeeeeeeeee  Avery Smith    AveryS@contoso.com              True             Member
eeeeeeee-4444-5555-6666-ffffffffffff  Sawyer Miller  SawyerM@contoso.com             True             Member
```

This example demonstrates how to retrieve all users assigned a specific license.

### Example 5: Get a list of users, their assigned licenses, and licensing source

```powershell
Connect-Entra -Scopes 'Organization.Read.All', 'User.Read.All', 'Group.Read.All', 'LicenseAssignment.Read.All'

# Get all users with specified properties
$Users = Get-EntraUser -All -Property AssignedLicenses, LicenseAssignmentStates, DisplayName, UserPrincipalName, ObjectId

$SelectedUsers = $Users | Select-Object ObjectId, UserPrincipalName, DisplayName, AssignedLicenses -ExpandProperty LicenseAssignmentStates

# Group Name lookup
$GroupDisplayNames = @{}

# Sku Part Number lookup
$SkuPartNumbers = @{}

# Populate the hashtable with group display names and SKU part numbers
foreach ($User in $SelectedUsers) {
    $AssignedByGroup = $User.AssignedByGroup
    $SkuId = $User.SkuId

    try {
        # Check if the group display name is already in the hashtable
        if (-not $GroupDisplayNames.ContainsKey($AssignedByGroup)) {
            $Group = Get-EntraGroup -GroupId $AssignedByGroup
            $GroupDisplayNames[$AssignedByGroup] = $Group.DisplayName
        }

        $User | Add-Member -NotePropertyName 'GroupDisplayName' -NotePropertyValue $GroupDisplayNames[$AssignedByGroup]
    }
    catch {
        $User | Add-Member -NotePropertyName 'GroupDisplayName' -NotePropertyValue 'N/A (Direct Assignment)'
    }

    try {
        # Check if the SKU part number is already in the hashtable
        if (-not $SkuPartNumbers.ContainsKey($SkuId)) {
            $Sku = Get-EntraSubscribedSku | Where-Object { $_.SkuId -eq $SkuId } | Select-Object -ExpandProperty SkuPartNumber
            $SkuPartNumbers[$SkuId] = $Sku
        }

        $User | Add-Member -NotePropertyName 'SkuPartNumber' -NotePropertyValue $SkuPartNumbers[$SkuId]
    }
    catch {
        $User | Add-Member -NotePropertyName 'SkuPartNumber' -NotePropertyValue 'N/A'
    }
}

$SelectedUsers | Format-Table UserPrincipalName, DisplayName, AssignedByGroup, GroupDisplayName, SkuId, SkuPartNumber, State, Error -AutoSize
```

```Output
userPrincipalName       displayName       assignedByGroup                      GroupDisplayName    skuId                                SkuPartNumber  state  error
-----------------       -----------       ---------------                      ----------------    -----                                -------------  -----  -----
averyh@contoso.com      Avery Howard      cccccccc-2222-3333-4444-dddddddddddd Contoso Team        abcdefgh-1111-2222-bbbb-cccc33333333 ENTERPRISEPACK Active None
devont@contoso.com      Devon Torres      ffffffff-5555-6666-7777-aaaaaaaaaaaa Retail              abcdefgh-1111-2222-bbbb-cccc33333333 ENTERPRISEPACK Active None
```

This example shows a list of users, their licenses, and the source of the license such as directly assigned or group assigned.

## PARAMETERS

### -SubscribedSkuId

The object ID of the SKU (Stock Keeping Unit).

```yaml
Type: System.String
Parameter Sets: GetById
Aliases: ObjectId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Property

Specifies properties to be returned.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases: Select

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraSubscription](Get-EntraSubscription.md)
