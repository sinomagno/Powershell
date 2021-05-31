# get a reference to the config instance 

$tsgs = gwmi -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -Filter "TerminalName='RDP-tcp'" 

# grab the thumbprint of the first SSL cert in the computer store 

$thumbprint = (gci -path cert:/LocalMachine/My) | foreach-object ($_){ if($_.subject -like '*CN='+$env:computername+'*' -and $_.Issuer -like '*'+(gwmi win32_NT -filter "DcSiteName = 'Default-First-Site-Name'").DomainName+'*' -and (Get-Date -Format "dd/MM/yyyy") -ge $_.NotAfter.ToString().Remove(10)) {echo $_.Thumbprint}}

# set the new thumbprint value 

swmi -path $tsgs.__path -argument @{SSLCertificateSHA1Hash="$thumb"} 