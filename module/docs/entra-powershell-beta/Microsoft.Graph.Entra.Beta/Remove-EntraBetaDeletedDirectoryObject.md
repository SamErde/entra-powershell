---
title: Remove-EntraBetaDeletedDirectoryObject
description: This article provides details on the Remove-EntraBetaDeletedDirectoryObject command.


ms.topic: reference
ms.date: 08/07/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru

external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra.Beta/Remove-EntraBetaDeletedDirectoryObject

schema: 2.0.0
---

# Remove-EntraBetaDeletedDirectoryObject

## Synopsis

Permanently delete a previously deleted directory object

## Syntax

```powershell
Remove-EntraBetaDeletedDirectoryObject 
 -Id <String> 
 [<CommonParameters>]
```

## Description

The `Remove-EntraBetaDeletedDirectoryObject` cmdlet is used to permanently delete a previously deleted directory object.

When a directory object is permanently deleted, it can no longer be restored.

## Examples

### Example 1: Delete a previously deleted directory object

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' #Application resource type
Connect-Entra -Scopes 'Group.ReadWrite.All' #Group resource type
Connect-Entra -Scopes 'Application.ReadWrite.All' #Service Principal resource type
Connect-Entra -Scopes 'User.ReadWrite.All' #User resource type

Remove-EntraBetaDeletedDirectoryObject -Id 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
```

This example demonstrates how to permanently delete a previously deleted directory object by Id.

- `-Id` parameter specifies the Id of the directory object that is permanently deleted.

NOTE: For delegated scenarios, the calling user needs to have at least one of the following Microsoft Entra roles.

- To permanently delete deleted applications or service principals: `Application Administrator`, `Cloud Application Administrator`, or `Hybrid Identity Administrator`.
- To permanently delete deleted users: `User Administrator`.
- To permanently delete deleted groups: `Groups Administrator`.

## Parameters

### -Id

The Id of the directory object that is permanently deleted.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## Inputs

### System.String

## Outputs

### System.Object

## Notes

## Related Links

[Get-EntraBetaDeletedDirectoryObject](Get-EntraBetaDeletedDirectoryObject.md)

[Restore-EntraBetaDeletedDirectoryObject](Restore-EntraBetaDeletedDirectoryObject.md)
