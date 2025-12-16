param($saisie)# = Read-Host -Prompt 'saisie here'
$services = Get-Service -Name $saisie
$services |
Select-Object Name, Status, StartType |
Export-Csv -Path services.csv -Delimiter ';' -Encoding utf8