$vm = New-PSSession -ComputerName 10.175.11.66 -Credential (Get-Credential -UserName administrator)
$vm

Copy-Item -Path 'C:\notepad++.exe' -ToSession $vm -Destination 'C:\Windows\Temp'
Invoke-Command -Session $vm -ScriptBlock {
    cmd.exe /c "C:\Windows\Temp\notepad++.exe /S" 
    Remove-Item -Path 'C:\Windows\Temp\notepad++.exe'
}
$vm | Remove-PSSession