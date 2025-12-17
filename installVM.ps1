$InformationPreference = 'Continue'

$ID = '1HX40Tz76gL0Cm9DdmcL7vJch9IVXYAA6'
$zipFile = "https://drive.google.com/uc?export=download&id=$ID&confirm=t"
$zipFile = "https://drive.usercontent.google.com/download?id=$ID&export=download&confirm=t"
Invoke-WebRequest -Uri $zipFile -OutFile "C:\Windows 2022 AD.zip"

Write-Information 'Unzip'
Expand-Archive -Path 'C:\Windows 2022 AD.zip' -DestinationPath 'C:\'

Write-Information 'Import VM'
Import-VM -Path ((Get-ChildItem 'C:\Windows 2022 AD' -Include '*.vmcx' -Recurse)[0].FullName) -Copy -GenerateNewId

Write-Information 'Unset DVD'
Get-VM | Get-VMDvdDrive | Set-VMDvdDrive -Path $null

Write-Information 'Start VM'
Get-VM | Start-VM