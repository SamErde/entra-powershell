---
title: Get-EntraUserMembership
description: This article provides details on the Get-EntraUserMembership command.


ms.topic: reference
ms.date: 06/26/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru
external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra/Get-EntraUserMembership

schema: 2.0.0
---

# Get-EntraUserMembership

## Synopsis

Get user memberships.

## Syntax

```powershell
Get-EntraUserMembership
 -ObjectId <String>
 [-All]
 [-Top <Int32>]
 [-Property <String[]>]
 [<CommonParameters>]
```

## Description

The `Get-EntraUserMembership` cmdlet gets user memberships in Microsoft Entra ID.

## Examples

### Example 1: Get user memberships

```powershell
Connect-Entra -Scopes 'User.Read'
Get-EntraUserMembership -ObjectId 'SawyerM@contoso.com'
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
11bb11bb-cc22-dd33-ee44-55ff55ff55ff
22cc22cc-dd33-ee44-ff55-66aa66aa66aa
33dd33dd-ee44-ff55-aa66-77bb77bb77bb
44ee44ee-ff55-aa66-bb77-88cc88cc88cc
55ff55ff-aa66-bb77-cc88-99dd99dd99dd
```

This example demonstrates how to retrieve user memberships in Microsoft Entra ID.

### Example 2: Get All memberships

```powershell
Connect-Entra -Scopes 'User.Read'
Get-EntraUserMembership -ObjectId 'SawyerM@contoso.com' -All
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
11bb11bb-cc22-dd33-ee44-55ff55ff55ff
22cc22cc-dd33-ee44-ff55-66aa66aa66aa
33dd33dd-ee44-ff55-aa66-77bb77bb77bb
44ee44ee-ff55-aa66-bb77-88cc88cc88cc
55ff55ff-aa66-bb77-cc88-99dd99dd99dd
```

This example demonstrates how to retrieve users all memberships in Microsoft Entra ID.

### Example 3: Get top three memberships

```powershell
Connect-Entra -Scopes 'User.Read'
Get-EntraUserMembership  -ObjectId 'SawyerM@contoso.com' -Top 3
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
11bb11bb-cc22-dd33-ee44-55ff55ff55ff
22cc22cc-dd33-ee44-ff55-66aa66aa66aa
```

This example demonstrates how to retrieve users top three memberships in Microsoft Entra ID.

## Parameters

### -All

List all pages.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ObjectId

Specifies the ID of a user (as a User Principal Name or ObjectId) in Microsoft Entra ID.

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

### -Top

Specifies the maximum number of records to return.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Property

Specifies properties to be returned

```yaml
Type: System.String[]
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

## Outputs

## Notes

## Related Links
