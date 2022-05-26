Add-KdsRootKey -EffectiveTime (Get-Date).AddHours(-10)

Get-KdsRootKey

Install-WindowsFeature RSAT-AD-PowerShell

New-ADGroup -Name "gmsaGroup" -GroupScope DomainLocal

New-ADServiceAccount -Name "gmsaAKS" -DnsHostName "gmsaAKS.co.uk" -ServicePrincipalNames "host/gmsaAKS", "host/gmsaAKS.co.uk" -PrincipalsAllowedToRetrieveManagedPassword "gmsaGroup"

New-ADUser -Name "StandardUser01" -AccountPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force) -Enabled 1
Add-ADGroupMember -Identity "gmsaGroup" -Members "StandardUser01"
   
Get-ADServiceAccount gmsaAKS -Properties PrincipalsAllowedToRetrieveManagedPassword
Get-ADServiceAccount -Identity gmsaAKS -Properties *

Set-ADServiceAccount gmsaAKS -PrincipalsAllowedToRetrieveManagedPassword StandardUser01, gmsaGroup