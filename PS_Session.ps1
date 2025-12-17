$vm = New-PSSession -ComputerName 10.175.11.66 -Credential (Get-Credential -UserName administrator)
$vm
Invoke-Command -Session $vm -ScriptBlock {
    Get-Volume | Select-Object DriveLetter, HealthStatus, @{Name = 'Size'; Expression = { $_.Size / 1Gb } }
}
$vm | Remove-PSSession