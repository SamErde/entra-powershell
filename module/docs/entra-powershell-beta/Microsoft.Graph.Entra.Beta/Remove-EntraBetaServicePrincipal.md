---
title: Remove-EntraBetaServicePrincipal
description: This article provides details on the Remove-EntraBetaServicePrincipal command.


ms.topic: reference
ms.date: 07/31/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru

external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra.Beta/Remove-EntraBetaServicePrincipal

schema: 2.0.0
---

# Remove-EntraBetaServicePrincipal

## Synopsis

Removes a service principal.

## Syntax

```powershell
Remove-EntraBetaServicePrincipal 
 -ObjectId <String> 
 [<CommonParameters>]
```

## Description

The `Remove-EntraBetaServicePrincipal` cmdlet removes a service principal in Microsoft Entra ID.

## Examples

### Example 1: Removes a service principal

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All','Application.ReadWrite.OwnedBy'
Remove-EntraBetaServicePrincipal -ObjectId '00001111-aaaa-2222-bbbb-3333cccc4444'
```

This example demonstrates how to remove a service principal in Microsoft Entra ID.

- `-ObjectId` parameter specifies the service principal Id.

## Parameters

### -ObjectId

Specifies the ID of a service principal in Microsoft Entra ID.

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

## Outputs

## Notes

## Related Links

[Get-EntraBetaServicePrincipal](Get-EntraBetaServicePrincipal.md)

[New-EntraBetaServicePrincipal](New-EntraBetaServicePrincipal.md)

[Set-EntraBetaServicePrincipal](Set-EntraBetaServicePrincipal.md)
