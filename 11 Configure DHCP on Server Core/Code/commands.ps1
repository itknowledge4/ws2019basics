#Install DHCP server role
Install-WindowsFeature DHCP

#Authorize DHCP server
Add-DhcpServerInDC

#Create scope
Add-DhcpServerv4Scope -StartRange 192.168.20.71 -EndRange 192.168.20.90`
                      -SubnetMask 255.255.255.0`
                      -Name 192.168.20.X -LeaseDuration 0.08:00:00
Set-DhcpServerv4OptionValue -ScopeId 192.168.20.0`
                            -DnsServer 192.168.20.1,192.168.20.2`
                            -Router 192.168.20.254`
                            -DnsDomain 'test.com'

#Configure DNS dynamic update credentials
$Credential=Get-Credential
Set-DhcpServerDnsCredential -Credential $Credential