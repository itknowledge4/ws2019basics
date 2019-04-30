#Install the ADDS role
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Promote the server in an existing domain
Install-ADDSDomainController -DomainName 'test.com' 

#Configure DNS on the local server
#Get list of DNS settings by interface and address type
Get-DnsClientServerAddress

#Reset DNS settings on the Ethernet interface so IPv6 is not used
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ResetServerAddresses
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses 192.168.20.2,192.168.20.1

#Configure DNS on Lab-DC01 remotely
$scrbl={
	Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ResetServerAddresses
	Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses 192.168.20.1,192.168.20.2
}
Invoke-Command -ComputerName Lab-DC01 -ScriptBlock $scrbl