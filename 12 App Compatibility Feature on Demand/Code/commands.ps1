#Make sure you have the FOD ISO mounted or you have the repository stored somewhere on your network

#Install the App Compatibility FOD
#Use -LimitAccess to stop the command from searching for the FOD in Windows Update or WSUS
#Source is the root of your FOD repository
Add-WindowsCapability -Online -Name ServerCore.AppCompatibility~~~~0.0.1.0 -Source D:\ -LimitAccess

Restart-Computer

#Install the Failover Clustering feature to get the console also
Install-WindowsFeature -Name Failover-Clustering -IncludeManagementTools
Restart-Computer

#Install Internet Explorer
$package_path = "D:\Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~.cab"
Add-WindowsPackage -Online -PackagePath $package_path