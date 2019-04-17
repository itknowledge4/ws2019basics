#Enable firewall rules

#You can check if they are enabled first with the following CmdLets
Get-NetFirewallRule FPS-ICMP4-ERQ-In | Select-Object -ExpandProperty Enabled
Get-NetFirewallRule FPS-SMB-In-TCP | Select-Object -ExpandProperty Enabled

#Ping rule
Enable-NetFirewallRule FPS-ICMP4-ERQ-In

#File sharing rule
Enable-NetFirewallRule FPS-SMB-In-TCP
