---
title: New-EntraAttributeSet
description: This article provides details on the New-EntraAttributeSet command.

ms.topic: reference
ms.date: 07/19/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: mwongerapk
author: msewaweru

external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra/New-EntraAttributeSet

schema: 2.0.0
---

# New-EntraAttributeSet

## Synopsis

Adds a new attribute set.

## Syntax

```powershell
New-EntraAttributeSet
 [-AttributeSetId <String>]
 [-Description <String>]
 [-MaxAttributesPerSet <Int32>]
 [<CommonParameters>]
```

## Description

Adds a new Microsoft Entra ID attribute set object.

In delegated scenarios with work or school accounts, the signed-in user must be assigned a supported Microsoft Entra role or a custom role with the necessary permissions. The Attribute Definition Administrator is the only privileged role supported for this operation.

## Examples

### Example 1: Add a single attribute set

```powershell
Connect-Entra -Scopes 'CustomSecAttributeDefinition.ReadWrite.All'
$params = @{
    AttributeSetId = 'NewCustomAttributeSet'
    Description = 'Attributes for engineering team'
    MaxAttributesPerSet = 10
}

New-EntraAttributeSet @params
```

```Output
Id      Description                     MaxAttributesPerSet
--      -----------                     -------------------
Testing Attributes for engineering team 10
```

This example demonstrates hoe to add a single attribute set.

- `-Id` parameter specifies the name of the attribute set.
- `-Description` parameter specifies the description for the attribute set.
- `-MaxAttributesPerSet` parameter specifies the maximum number of custom security attributes.

## Parameters

### -Description

Description of the attribute set, up to 128 characters long, including Unicode characters. This description can be changed later.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AttributeSetId

Name of the attribute set. Unique identifier for the attribute set within a tenant, up to 32 Unicode characters. It can't contain spaces or special characters, is case sensitive, and can't be changed later. Required.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: Id

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxAttributesPerSet

Maximum number of custom security attributes that can be defined in this attribute set. The default value is null. If not specified, the administrator can add up to 500 active attributes per tenant. This setting can be changed later.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## Inputs

### None

## Outputs

### System.Object

## Notes

## Related Links

[Get-EntraAttributeSet](Get-EntraAttributeSet.md)

[Set-EntraAttributeSet](Set-EntraAttributeSet.md)
