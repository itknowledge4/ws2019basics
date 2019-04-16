#Enable firewall rules

#Ping rule
Enable-NetFirewallRule FPS-ICMP4-ERQ-In

#File sharing rule
Enable-NetFirewallRule FPS-SMB-In-TCP
