---
description: This article provides details on the Get-EntraBetaUserGroup command.
external help file: Microsoft.Entra.Beta.Users-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 12/02/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Get-EntraBetaUserGroup
schema: 2.0.0
title: Get-EntraBetaUserGroup
---

# Get-EntraBetaUserGroup

## SYNOPSIS

Retrieves the list of groups a user belongs to.

## SYNTAX

### GetQuery (Default)

```powershell
Get-EntraBetaUserGroup
 -UserId <String>
 [-All]
 [-Top <Int32>]
 [-Filter <String>]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetById

```powershell
Get-EntraBetaUserGroup
 -UserId <String>
 -GroupId <String>
 [-Property <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION

The `Get-EntraBetaUserGroup` cmdlet retrieves a list of groups to which a user belongs.

## EXAMPLES

### Example 1: Get a list of groups to which a specific user belongs

```powershell
Connect-Entra -Scopes 'GroupMember.Read.All', 'Group.Read.All', 'Directory.Read.All'
Get-EntraBetaUserGroup -UserId 'SawyerM@contoso.com'
```

```Output
DisplayName                Id                                   MailNickname        Description               GroupTypes
-----------                --                                   ------------        -----------               ----------
Contoso Marketing          hhhhhhhh-3333-5555-3333-qqqqqqqqqqqq ContosoMarketing    Contoso Marketing         {Unified}
Mark 8 Project Team        pppppppp-4444-0000-8888-yyyyyyyyyyyy  Mark8ProjectTeam    Mark 8 Project Team       {Unified}
Leadership                 tttttttt-0000-3333-9999-mmmmmmmmmmmm  Leadership          Leadership                {Unified}
Sales and Marketing        qqqqqqqq-5555-0000-1111-hhhhhhhhhhhh  SalesAndMarketing   Sales and Marketing       {Unified}
Retail                     aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb  Retail              Retail                    {Unified}
```

This cmdlet retrieves a list of groups to which a specific user belongs.

### Example 2: Get a list of groups to which a specific user belongs using the All parameter

```powershell
Connect-Entra -Scopes 'GroupMember.Read.All', 'Group.Read.All', 'Directory.Read.All'
Get-EntraBetaUserGroup -UserId 'SawyerM@contoso.com' -All
```

```Output
DisplayName                Id                                   MailNickname        Description               GroupTypes
-----------                --                                   ------------        -----------               ----------
Contoso Marketing          hhhhhhhh-3333-5555-3333-qqqqqqqqqqqq ContosoMarketing    Contoso Marketing         {Unified}
Mark 8 Project Team        pppppppp-4444-0000-8888-yyyyyyyyyyyy  Mark8ProjectTeam    Mark 8 Project Team       {Unified}
Leadership                 tttttttt-0000-3333-9999-mmmmmmmmmmmm  Leadership          Leadership                {Unified}
Sales and Marketing        qqqqqqqq-5555-0000-1111-hhhhhhhhhhhh  SalesAndMarketing   Sales and Marketing       {Unified}
Retail                     aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb  Retail              Retail                    {Unified}
```

This cmdlet retrieves a list of groups to which a specific user belongs using the All parameter.

### Example 3: Get a group to which a specific user belongs

```powershell
Connect-Entra -Scopes 'GroupMember.Read.All', 'Group.Read.All', 'Directory.Read.All'
Get-EntraBetaUserGroup -UserId 'SawyerM@contoso.com' -Top 1
```

```Output
DisplayName                Id                                   MailNickname        Description               GroupTypes
-----------                --                                   ------------        -----------               ----------
Contoso Marketing          hhhhhhhh-3333-5555-3333-qqqqqqqqqqqq ContosoMarketing    Contoso Marketing         {Unified}
```

This cmdlet retrieves a group to which a specific user belongs. You can use `-Limit` as an alias for `-Top`.

### Example 4: Get a list of groups to which a specific user belongs using the group ID parameter

```powershell
Connect-Entra -Scopes 'GroupMember.Read.All', 'Group.Read.All', 'Directory.Read.All'
$group = Get-EntraBetaGroup -Filter "DisplayName eq 'Contoso Marketing'"
Get-EntraBetaUserGroup -UserId 'SawyerM@contoso.com' -GroupId $group.Id
```

```Output
DisplayName                Id                                   MailNickname        Description               GroupTypes
-----------                --                                   ------------        -----------               ----------
Contoso Marketing          hhhhhhhh-3333-5555-3333-qqqqqqqqqqqq ContosoMarketing    Contoso Marketing         {Unified}
```

This cmdlet retrieves a list of groups to which a specific user belongs using the group ID parameter.

- `-GroupId` parameter specifies the group ID.

## PARAMETERS

### -UserId

Specifies the ID of a user's UserPrincipalName or UserId in Microsoft Entra ID.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: ObjectId, UPN, Identity, UserPrincipalName

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

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

### -Top

The maximum number of groups a user belongs to.

```yaml
Type: System.Int32
Parameter Sets: GetQuery
Aliases: Limit

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
Aliases: Select

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId

The unique ID of the group.

```yaml
Type: System.String
Parameter Sets: GetQuery
Aliases: DirectoryObjectId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Filter

Specifies an OData v4.0 filter statement.
This parameter controls which objects are returned.

```yaml
Type: System.String
Parameter Sets: GetQuery
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Get-EntraBetaUserMembership](Get-EntraBetaUserMembership.md)
