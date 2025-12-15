Get-Service | Format-List Name, Id, CPU ;
Get-Process | Format-List Name, Id, CPU ;
Stop-Process -Name "notepad" ;
New-Item -Path "C:\" -Name "Formation" -ItemType "Directory";
New-Item -Path "C:\Formation\" -Name "Jour1.ps1" -ItemType "File";
Get-Variable PS* | Format-List Name, Value ;
Get-ChildItem -Path C:\Windows\System\ -Recurse –File ;
Get-ChildItem -Path C:\Windows\System32\ -Recurse –File ;