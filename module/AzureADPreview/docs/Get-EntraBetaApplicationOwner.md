---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Get-EntraBetaApplicationOwner

## SYNOPSIS
Gets the owner of an application.

## SYNTAX

```
Get-EntraBetaApplicationOwner [-Top <Int32>] -ObjectId <String> [-All <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
The Get-EntraBetaApplicationOwner cmdlet get an owner of an Azure Active Directory application.

## EXAMPLES

### Example 1: Get the owner of an application
```
PS C:\>Get-EntraBetaApplicationOwner -ObjectId "3ddd22e7-a150-4bb3-b100-e410dea1cb84"

ObjectId                             ObjectType
--------                             ----------
c13dd34a-492b-4561-b171-40fcce2916c5 User
```

This command gets the owner of an application.

## PARAMETERS

### -All
If true, return all owners.
If false, return the number of objects specified by the Top parameter

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ObjectId
Specifes the ID of an application in Azure Active Directory.

```yaml
Type: String
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
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Add-EntraBetaApplicationOwner]()

[Remove-EntraBetaApplicationOwner]()
