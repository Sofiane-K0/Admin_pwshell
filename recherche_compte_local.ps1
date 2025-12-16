param ($day)



$dates = (Get-Date).AddDays($day)

foreach ($user in Get-LocalUser) {
    if ($user.PasswordLastSet -lt $dates  ) {
        Write-Host $user
        Write-Host $user.PasswordLastSet
        Write-Host $user.Description

    }
     
}

$services = Get-LocalUser
$services |
Select-Object Name, PasswordLastSet, Description |
Export-Csv -Path users.csv -Delimiter ';' -Encoding utf8
