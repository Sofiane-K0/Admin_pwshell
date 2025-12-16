
# $object = [pscustomobject]@{Name = "$env:computername"; List = @(1, 2, 3, 4, 5) }





# $customObject = 1 | Select-Object -Property PcName, UserName, IP, Serial, OS
# $customObject.PcName = $env:computername
# $customObject.UserName = $env:USERNAME
# $customObject.IP = (Get-NetIPAddress -AddressFamily IPv4).IPAddress
# $customObject.Serial = (Get-WmiObject -class win32_bios).SerialNumber
# $customObject.OS = Get-CimInstance Win32_OperatingSystem



 
# $customObject
$OSver = Get-ComputerInfo

[PSCustomObject]@{
    PcName   = $env:computername
    UserName = $env:USERNAME
    IP       = (Get-NetIPAddress -AddressFamily IPv4).IPAddress
    # Serial   = (Get-WmiObject -class win32_bios).SerialNumber
    Serial   = $OSver.OsSerialNumber
    # OS       = Get-CimInstance Win32_OperatingSystem
    OS       = $OSver.OsVersion
}

