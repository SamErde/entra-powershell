---
description: This article provides details on the Remove-EntraGroup command.
external help file: Microsoft.Entra.Groups-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Remove-EntraGroup
schema: 2.0.0
title: Remove-EntraGroup
---

# Remove-EntraGroup

## SYNOPSIS

Removes a group.

## SYNTAX

```powershell
Remove-EntraGroup
 -GroupId <String>
 [<CommonParameters>]
```

## DESCRIPTION

The `Remove-EntraGroup` cmdlet removes a group from Microsoft Entra ID. Specify the `GroupId` parameter removes a group. 

Unified Group can be restored withing 30 days after deletion using the `Restore-EntraBetaDeletedDirectoryObject` cmdlet. Security groups can't be restored after deletion.

**Notes on permissions:**

The following conditions apply for apps to delete role-assignable groups:

- For delegated scenarios, the app must be assigned the `RoleManagement.ReadWrite.Directory` delegated permission, and the calling user must be the creator of the group or be assigned at least the Privileged Role Administrator Microsoft Entra role.
- For app-only scenarios, the calling app must be the owner of the group or be assigned the `RoleManagement.ReadWrite.Directory` application permission or be assigned at least the Privileged Role Administrator Microsoft Entra role.

## EXAMPLES

### Example 1: Remove a group

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All'
$group = Get-EntraGroup -Filter "DisplayName eq 'HelpDesk Team Leaders'"
Remove-EntraGroup -GroupId $group.Id
```

This example demonstrates how to remove a group in Microsoft Entra ID.

- `GroupId` parameter specifies the group ID .

### Example 2: Remove a group using pipelining

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All'
Get-EntraGroup -Filter "DisplayName eq 'HelpDesk Team Leaders'" | Remove-EntraGroup
```

This example demonstrates how to remove a group in Microsoft Entra ID.

## PARAMETERS

### -GroupId

Specifies the object ID of a group in Microsoft Entra ID.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: ObjectId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraGroup](Get-EntraGroup.md)

[New-EntraGroup](New-EntraGroup.md)

[Set-EntraGroup](Set-EntraGroup.md)
