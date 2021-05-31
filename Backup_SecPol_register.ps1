# Create a backup of security policies and register for a list of IP servers.
# The backup is saved inside each server

clear-host 

$servers = gc "C:\ServerIPs.txt" 

foreach ($serverName in $servers){ 

    $ps = New-PSSession -ComputerName $serverName 

    Invoke-Command -Session $ps -ScriptBlock{ 

        new-item C:\instaladores -ItemType Directory 

        $path = "c:\secpol " + $env:COMPUTERNAME + ".cfg" 

        secedit /export /cfg $path 

        $path = "C:\Backup " + $env:COMPUTERNAME + ".reg" 

        reg export HKLM $path 

    } 

    Get-PSSession | Remove-PSSession 

} 

$servers = "" 