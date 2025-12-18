$vm = New-PSSession -ComputerName 10.175.11.66 -Credential (Get-Credential -UserName administrator)
$vm

Invoke-Command -Session $vm -ScriptBlock {
    # cmd.exe /c "C:\Windows\Temp\notepad++.exe /S" 

    # $services = Get-ADuser
    # $services |
    # Select-Object Name, Surname |
    # Export-Csv -Path ADusers.csv -Delimiter ';' -Encoding utf8


    Get-ADUser -Filter * | Select-object DistinguishedName, Name, UserPrincipalName | Export-Csv -NoType C:\Users\


}
$vm | Remove-PSSession