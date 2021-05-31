# Change a local account of a list of IP servers

Clear-Host 

$servers = gc "C:\ServerIPs.txt" 

#echo $servers.length 

foreach ($SerIP In $servers) 

{ 

    Get-WmiObject Win32_UserAccount -ComputerName $SerIP -filter "LocalAccount = TRUE AND disabled = FALSE AND NAME = 'Administrator'" | ForEach-Object {$_.Rename("SinoUser")} 

} 