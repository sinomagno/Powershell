# With a list of IP servers it will do a basic hardening for the SMB server
# Disable the SMBv1
# Requir eSecurity Signature for SMB
# Enable Security Signature for SMB

$servers = gc "C:\ServerIPs.txt" 

foreach ($serverName in $servers){ 
     $Error.Clear() 
    "-----------------------------------------" |Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    Get-date |Out-File $("C:\SMBConfiguration" + $servername + ".txt") 
    $servername | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    (Get-WmiObject -Class Win32_PingStatus -Filter "Address='$servername'").IPV4Address.IPAddressToString |Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 

    "-----------------------------------------" |Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 

    $smbsession = New-CimSession -ComputerName $serverName 
    $GetSMB = Get-SmbServerConfiguration -CimSession $smbsession 

    "Configuración inicial del servicio de SMB del servidor " +$serverName | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 

    "-----------------------------------------" |Out-File -Append $("C:\Instaladores\SMBConfiguration" + $servername + ".txt") 
    $GetSMB | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    "-----------------------------------------" |Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
 
    if ($GetSMB.EnableSMB1Protocol){ 
        set-SmbServerConfiguration -CimSession $smbsession -EnableSMB1Protocol $False -Force 
        "Se ha deshabilitado el protocolo SMBv1" | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    } 
    else{ 
        "El servidor " + $servername + " no tiene habilitado el protocolo SMBv1" | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    } 
 
    if (-NOT ($GetSMB.RequireSecuritySignature)) 
    { 
        set-SmbServerConfiguration -CimSession $smbsession -RequireSecuritySignature $True -Force 
        "Se ha habilitado la solicitud de firma de seguridad para la conexión al servidor SMB" | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    } 
    else 
    { 
        "El servidor " + $servername + " ya tenía habilitado la solicitud de firma de seguridad para la conexión al servidor SMB" | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    } 
 
    if (-NOT ($GetSMB.EnableSecuritySignature)) 
    { 
        set-SmbServerConfiguration -CimSession $smbsession -EnableSecuritySignature $True -Force 
        "Se ha habilitado la firma de seguridad" | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    } 
    else { 
        "El servidor " + $servername + " tiene habilitado la firma de seguridad" | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    } 

    "-----------------------------------------" |Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    "Configuración final del servicio de SMB del servidor" +$serverName | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    "-----------------------------------------" |Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    Get-SmbServerConfiguration -CimSession $smbsession | Out-File -Append $("C:\SMBConfiguration" + $servername + ".txt") 
    (gc $("C:\SMBConfiguration" + $servername + ".txt")) | ? {$_.trim() -ne "" } | set-content $("C:\SMBConfiguration" + $servername + ".txt") 
} 

Get-CimSession | Remove-CimSession 