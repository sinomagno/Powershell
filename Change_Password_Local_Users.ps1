# Given a list of IP servers change all LocalUser the password

$servers = gc "C:\ChangeUserPass\ServerIPs.txt" 

$Password = "SinoUser12334" 

#echo $servers.length 

foreach ($SerIP In $servers) 
{ 
    $remoteuser = get-wmiobject win32_useraccount -computername $SerIp -filter "LocalAccount = TRUE AND disabled = FALSE" 
    echo $remoteuser 
    echo $SerIP 
    if ($remoteuser.name -is [system.array]) 
        { 
            $RemoteAccount = $remoteuser.Name[0] 
            echo 1 
        } 
    else{ 
            $RemoteAccount = $remoteuser.Name 
            echo 2 
    } 
    echo $RemoteAccount 
    $user = ([ADSI] "WinNT://$SerIp/$RemoteAccount,user") 
    $user.SetPassword($Password)     

} 