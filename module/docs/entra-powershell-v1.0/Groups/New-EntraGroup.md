---
author: msewaweru
description: This article provides details on the New-EntraGroup command.
external help file: Microsoft.Entra.Groups-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/New-EntraGroup
schema: 2.0.0
title: New-EntraGroup
---

# New-EntraGroup

## SYNOPSIS

Creates a Microsoft Entra ID group.

## SYNTAX

```powershell
New-EntraGroup
 -DisplayName <String>
 [-GroupTypes <System.Collections.Generic.List`1[System.String]>]
 -SecurityEnabled <Boolean>
 [-Description <String>]
 -MailEnabled <Boolean>
 -MailNickname <String>
 [-Visibility <String>]
 [-IsAssignableToRole <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION

The `New-EntraGroup` cmdlet creates a Microsoft Entra ID group. Specify the `DisplayName`, `MailNickname`, `MailEnabled` and `SecurityEnabled` parameters for creating a Microsoft Entra ID group.

For information about creating dynamic groups, see: [Using attributes to create advanced rules](https://learn.microsoft.com/entra/identity/users/groups-dynamic-membership).

**Notes on permissions:**

- To create the group with users as owners or members, the app must have at least the `User.Read.All` permission.
- To create the group with other service principals as owners or members, the app must have at least the `Application.Read.All` permission.
- To create the group with either users or service principals as owners or members, the app must have at least the `Directory.Read.All` permission.

## EXAMPLES

### Example 1: Create a group

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All','Group.Create'
$params = @{
    DisplayName = 'HelpDesk admin group2'
    MailEnabled = $False
    MailNickname = 'helpDeskAdminGroup'
    SecurityEnabled = $True
}

New-EntraGroup @params
```

```Output
DisplayName           Id                                   MailNickname       Description GroupTypes
-----------           --                                   ------------       ----------- ----------
HelpDesk admin group2 bbbbbbbb-5555-5555-0000-qqqqqqqqqqqq helpDeskAdminGroup             {}
```

This example demonstrates how to create the new group.

### Example 2: Create a group with Description parameter

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All','Group.Create'
$params = @{
    DisplayName = 'HelpDesk admin group'
    MailEnabled = $false
    MailNickname = 'helpDeskAdminGroup'
    SecurityEnabled = $true
    Description = 'Group assignable to role'
}

New-EntraGroup @params
```

```Output

DisplayName          Id                                   MailNickname       Description              GroupTypes
-----------          --                                   ------------       -----------              ----------
HelpDesk admin group zzzzzzzz-6666-8888-9999-pppppppppppp helpDeskAdminGroup Group assignable to role {}

```

This example demonstrates how to create the new group with description parameter.

### Example 3: Create a group with IsAssignableToRole parameter

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All','Group.Create'
$params = @{
    DisplayName = 'HelpDesk admin group2'
    Description = 'Group assignable to role'
    MailEnabled = $False
    MailNickname = 'helpDeskAdminGroup'
    SecurityEnabled = $True
    IsAssignableToRole = $True
}

New-EntraGroup @params
```

```Output
DisplayName           Id                                   MailNickname       Description              GroupTypes
-----------           --                                   ------------       -----------              ----------
HelpDesk admin group2 vvvvvvvv-8888-9999-0000-jjjjjjjjjjjj helpDeskAdminGroup Group assignable to role {}
```

This example demonstrates how to create the new group with IsAssignableToRole parameter.

### Example 4: Create a group with Visibility parameter

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All','Group.Create'
$params = @{
    DisplayName = 'HelpDesk admin group2'
    Description = 'Group assignable to role'
    MailEnabled = $False
    MailNickname = 'helpDeskAdminGroup'
    SecurityEnabled = $True
    Visibility = 'Private'
}

New-EntraGroup @params
```

```Output
DisplayName           Id                                   MailNickname       Description              GroupTypes
-----------           --                                   ------------       -----------              ----------
HelpDesk admin group2 gggggggg-0000-4444-3333-llllllllllll helpDeskAdminGroup Group assignable to role {}
```

This example demonstrates how to create the new group with Visibility parameter.

### Example 5: Create a group with GroupTypes parameter

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All','Group.Create'
$params = @{
    DisplayName = 'HelpDesk admin group3'
    Description = 'group des'
    MailEnabled = $False
    MailNickname = 'helpDeskAdminGroup1'
    SecurityEnabled = $True
    GroupTypes = 'Unified'
}

New-EntraGroup @params
```

```Output
DisplayName           Id                                   MailNickname        Description GroupTypes
-----------           --                                   ------------        ----------- ----------
HelpDesk admin group3 xxxxxxxx-8888-5555-9999-bbbbbbbbbbbb helpDeskAdminGroup1 group des   {Unified}
```

This example demonstrates how to create the new group with GroupTypes parameter.

## PARAMETERS

### -Description

Specifies a description for the group.

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

### -DisplayName

Specifies a display name for the group.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MailEnabled

Specifies whether this group is mail enabled.

Currently, you can't create mail enabled groups in Microsoft Entra ID.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MailNickname

Specifies a mail nickname for the group.
If MailEnabled is $False, you must still specify a mail nickname.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecurityEnabled

Specifies whether the group is security enabled.
For security groups, this value must be $True.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupTypes

Specifies that the group is a unified or dynamic group. 

Notes: 

- This parameter currently can't be used to create dynamic groups. To create a dynamic group in PowerShell, you must use the Entra module.

```yaml
Type: System.Collections.Generic.List`1[System.String]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Visibility

This parameter determines the visibility of the group's content and members list.

This parameter can take one of the following values:

- "Public" - Anyone can view the contents of the group
- "Private" - Only members can view the content of the group
- "HiddenMembership" - Only members can view the content of the group and only members, owners, Global/Company Administrator, User Administrator and Helpdesk Administrators can view the members list of the group.

If no value is provided, the default value is "Public".

Notes:

- This parameter is only valid for groups that have the groupType set to "Unified".
- If a group has this attribute set to "HiddenMembership", it can't be changed later.
- Anyone can join a group that has this attribute set to "Public". If the attribute is set to Private or HiddenMembership, only owners can add new members to the group and requests to join the group need approval of the owners.

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

### -IsAssignableToRole

Indicates whether group can be assigned to a role. This property can only be set at the time of group creation and can't be modified on an existing group.

```yaml
Type: System.Boolean
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

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Get-EntraGroup](Get-EntraGroup.md)

[Remove-EntraGroup](Remove-EntraGroup.md)

[Set-EntraGroup](Set-EntraGroup.md)

[Using attributes to create advanced rules](https://learn.microsoft.com/entra/identity/users/groups-dynamic-membership)
