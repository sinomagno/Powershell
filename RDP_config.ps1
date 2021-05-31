# Configure the RDP options level encryption and the network layer authentication for a list of IP servers.
# Save the output

Clear-Host 

function levelEncryptionRDP([uint32]$levelcryption, [string]$SName){ 
    Get-date | Out-File -Append $("C:\levelEncryption" + $Sname + ".txt") 
    Test-Connection $SName -count 1 | select @{Name="Computername";Expression={$_.Address}},Ipv4Address | Format-List |Out-File $("C:\RDPConfig" + $Sname + ".txt") 
    $ts = (Get-WmiObject -ComputerName $SName -class Win32_TSGeneralSetting -Namespace root\cimv2\terminalservices -Filter "TerminalName='RDP-tcp'") 
    $ts.SetEncryptionLevel($levelcryption) 
    if (-Not $Error[0].Equals(0)) 
    { 
        "Can't change encryption level" +  $Error[0] |Format-List | Out-File -Append $("C:\RDPConfig" + $Sname + "Error.txt") 
    } 
    else{ 
        "The encryption level was set to: " + $levelcryption | Out-File -Append $("C:\RDPConfig" + $Sname + ".txt") 
    } 
    (gc $("C:\levelEncryption" + $Sname + ".txt")) | ? {$_.trim() -ne "" } | set-content $("C:\levelEncryption" + $Sname + ".txt") 
} 

Function NetwrokLayerAuthentication([string]$ServerName){ 
    $ts = (Get-WmiObject -class Win32_TSGeneralSetting -Namespace root\cimv2\terminalservices -ComputerName $ServerName -Filter "TerminalName='RDP-tcp'") 
    if ($ts.UserAuthenticationRequired -eq 0)  
    { 
        $ts.SetUserAuthenticationRequired(1) 
        $Error[0] |Format-List -Force 
        "Se configuró el servidor con NLA para la autenticación de RDP"|Out-File $("C:\RDPConfig" + $Servername + ".txt") 
    } 
    else 
    { 
        "El servidor está usando NLA" |Out-File $("C:\RDPConfig" + $Sname + ".txt") 
    } 
} 

$servers = gc "C:\ServerIPs.txt" 

foreach ($serverName in $servers){ 
	"Please choose the minimum encryption level for RDP " 
	"1 for Low level encryption (LOW)" 
	"2 for Client-compatible level of encryption (LOW)" 
	"3 for High level of encryption (GOOD)" 
	"4 for FIPS-compilant encryption (TOO HIGH)" 

	$levencryption = read-host 

	$serverName 

	levelEncryptionRDP "$levencryption" "$ServerName" 

	NetworkLayerAuthentication "$ServerName" 
} 