### filename: trusted-sites.ps1
# by: Abhay Gupta
# date: 2020-12-08
# desc: add trusted site via registry keys
# cite: https://www.sharepointdiary.com/2019/09/map-network-drive-in-sharepoint-online-using-powershell.html
# 	https://superuser.com/questions/414097/how-to-view-all-ie-trusted-sites-when-security-settings-are-managed

### Manual Steps
# In powershell, check where trusted sites are defined:
# $(get-item "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey").property | Sort-Object
# $(get-item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey").property | Sort-Object

# Run regedit as Admin > navigated to trusted site list > add string w/ trusted site w/ value of 2
# Go to site in IE > and Install certificates

### Automated Steps

#Variable
$LibraryPath = "https://lamresearch.sharepoint.com/sites/WCO-MS-Team"
 
#Map Path as Network Drive
$Network = new-object -ComObject WScript.Network
$Network.MapNetworkDrive('R:', $LibraryPath)


#Read more: https://www.sharepointdiary.com/2019/09/map-network-drive-in-sharepoint-online-using-powershell.html#ixzz6g4jfxuFX


### Notes:
# 0 = My Computer
# 1 = Local Intranet Zone
# 2 = Trusted sites Zone
# 3 = Internet Zone
# 4 = Restricted Sites Zone

# execution policy: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.1
# alt: https://docs.microsoft.com/en-us/troubleshoot/windows-client/networking/error-access-network-drive-mapped-web-share
# * sharepoint.com
# *.sharepoint.com
# http://*.sharepoint.com
# https://*.sharepoint.com
# https://lamresearch.sharepoint.com

# alt: https://superuser.com/questions/1540987/network-path-could-not-be-found-on-a-drive-that-works-from-everywhere-else