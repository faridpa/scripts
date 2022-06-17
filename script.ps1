Install-WindowsFeature AD-Domain-Services
Import-Module ADDSDeployment
Install-ADDSForest -DomainName contoso.co.uk -Confirm -DomainNetbiosName CONTOSO -Force -InstallDns -LogPath C:\\Windows\NTDS -SafeModeAdministratorPassword (ConvertTo-SecureString -String "Pass1w0rd" -AsPlainText -Force) -SysvolPath C:\\Windows\SYSVOL
