---
title: Update-EntraBetaSignedInUserPassword.
description: This article provides details on the Update-EntraBetaSignedInUserPassword command.


ms.topic: reference
ms.date: 07/26/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG

external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra.Beta/Update-EntraBetaSignedInUserPassword

schema: 2.0.0
---

# Update-EntraBetaSignedInUserPassword

## Synopsis

Updates the password for the signed-in user.

## Syntax

```powershell
Update-EntraBetaSignedInUserPassword 
 -CurrentPassword <SecureString> 
 -NewPassword <SecureString>
 [<CommonParameters>]
```

## Description

The `Update-EntraBetaSignedInUserPassword` cmdlet updates the password for the signed-in user in Microsoft Entra ID.

Enable users to update their own passwords. Any user can change their password without requiring administrator privileges.

## Examples

### Example 1: Update a password

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$CurrentPassword = ConvertTo-SecureString '<strong-password>' -AsPlainText -Force
$NewPassword = ConvertTo-SecureString '<strong-password>' -AsPlainText -Force
$params = @{
    CurrentPassword = $CurrentPassword
    NewPassword = $NewPassword
}
Update-EntraBetaSignedInUserPassword @params
```

This command updates the password for the signed-in user.

- `-CurrentPassword` Parameter specifies the current password of the signed-in user.

- `-NewPassword` Parameter specifies the new password for the signed-in user.

## Parameters

### -CurrentPassword

Specifies the current password of the signed-in user.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -NewPassword

Specifies the new password for the signed-in user.

```yaml
Type: SecureString
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
