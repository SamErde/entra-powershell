---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Enable-EntraBetaDirectoryRole

## Synopsis
Activates an existing directory role in Azure Active Directory.

## Syntax

```
Enable-EntraBetaDirectoryRole [-RoleTemplateId <String>] [<CommonParameters>]
```

## Description
The Enable-EntraBetaDirectoryRole cmdlet activates an existing directory role in Azure Active Directory.

## Examples

### Example 1: Enable a directory role
```
# Retrieve the Template Role object for the Guest Inviter role 
$InviterRole = Get-EntraBetaDirectoryRoleTemplate | Where-Object {$_.DisplayName -eq "Guest Inviter"}

# Inspect the $Inveoter variable to make sure we found the correct template role
$InviterRole

ObjectId                             DisplayName   Description
--------                             -----------   -----------
95e79109-95c0-4d8e-aee3-d01accf2d47b Guest Inviter Guest Inviter has access to invite guest users.

# Enable the Inviter Role
Enable-EntraBetaDirectoryRole -RoleTemplateId $InviterRole.ObjectId

ObjectId                             DisplayName   Description
--------                             -----------   -----------
03618579-3c16-4765-9539-86d9163ee3d9 Guest Inviter Guest Inviter has access to invite guest users.
```

The first command gets an inviter role that has the display name Guest Inviter by using the Get-EntraBetaDirectoryRoleTemplate (./Get-EntraBetaDirectoryRoleTemplate.md)cmdlet. 
The command stores Guest Inviter in the $InviterRole variable.

The second command displays the contents of $InviterRole.

The final command enables the directory role in $InviterRole.

## Parameters



### -RoleTemplateId
The ID of the Role template to enable

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## Inputs

## Outputs

## Notes

## Related Links

[Get-EntraBetaDirectoryRole]()

[Get-EntraBetaDirectoryRoleTemplate]()

