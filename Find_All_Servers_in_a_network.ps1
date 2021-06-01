# Find all host in a network
# Find the hostname for all ip address found at the beginning

$LiteralfilePath = "C:\TestIp4.csv"

$TestIP = (1..127 | ForEach-Object -Process {Get-WmiObject -Class Win32_PingStatus -Filter ("Address='10.237.68." + $_ + "'") -ComputerName .} | Where-Object {$_.StatusCode -eq 0} )
$i=0

foreach ($IP in $TestIP.IPV4Address.IPAddressToString){
    $hash=@{
      IP = $IP
	  Server = [string]([system.net.dns]::GetHostbyAddress($IP).HostName)
	  Respose = $TestIP.ResponseTimeToLive[$i]
	}
   $i++
   $list = new-object PSObject -Property $hash
   $list | export-csv -LiteralPath $LiteralfilePath -Append -NoTypeInformation
}