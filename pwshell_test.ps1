# Create a new local user
$userName = "NewUser"
$password = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force

New-LocalUser -Name $userName -Password $password -FullName "New User" -Description "Test user account"

# Optional: Add user to a group (e.g., Administrators)
Add-LocalGroupMember -Group "Administrators" -Member $userName

Write-Host "User '$userName' created successfully."
ls C:\ 
cls

