# filename:	windows-packages.ps1
#
# by: 		Abhay Gupta
# date: 	2020-12-06
# desc: 	Runs powershell script to install packages on new or recovered computer
# 		Cite: https://github.com/lukesampson/scoop/issues/2289#issuecomment-538422132

### Right click file and click `Run with PowerShell`

### Alternative:
# Open `Start` > Search for `PowerShell` > Right-click `Run as Administrator`
## In Poweshell, type:
#	`Set-ExecutionPolicy RemoteSigned -Scope Process` # Allows running script files
# 	`./windows-package.sh` # File must be in active directory

### Auto-script commands
# Install Scoop -- Windows Package Manager
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop install `
git

scoop bucket add `
extras

scoop install `
googlechrome `
vscode `
sublime-text `
ruby `
beyondcompare `
perl


## Export scoop buckets & applications
# scoop export | select-string '\) \[(.+)\]$' |% { $_.matches.groups[1].value } | select -unique > buckets.txt
# scoop export | select-string '^(.+)\W\(v:' |% { $_.matches.groups[1].value } > apps.txt

## Install buckets & applications
# gc buckets.txt |% { scoop bucket add $_ }
# gc apps.txt |%  {scoop install $_}

