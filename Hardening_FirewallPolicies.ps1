#Create registers for hardening the Firewall based on the windows Security Baseline

function createKey([string]$path,[string]$pathkey, [string]$Subkey,$int,$property){ 

    $cp = Join-Path $path $pathkey 

    $cp 

    if(!(Test-Path -path $path)) 

    { 

        New-Item -Path $path 

        echo "hola" 

    } 

    if(!(Test-Path -Path $cp)) 

    { 

        New-Item -Path $cp 

        echo "bye" 

    } 

    if ($val.$Subkey -ne $int) 

    { 

    New-ItemProperty -path $cp -name $Subkey -value $int -PropertyType $property  

    echo "ok" 

    } 

} 


createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "DomainProfile" "DisableNotifications" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "DomainProfile" "AllowLocalIPsecPolicyMerge" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "DomainProfile" "AllowLocalPolicyMerge" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "DomainProfile" "DefaultInboundAction" "1" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "DomainProfile" "DefaultOutboundAction" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "DomainProfile" "DisableUnicastResponsesToMulticastBroadcast" "1" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PrivateProfile" "DisableUnicastResponsesToMulticastBroadcast" "1" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PrivateProfile" "AllowLocalIPsecPolicyMerge" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PrivateProfile" "AllowLocalPolicyMerge" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PrivateProfile" "DisableNotifications" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PrivateProfile" "DefaultInboundAction" "1" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PrivateProfile" "DefaultOutboundAction" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PublicProfile" " DisableUnicastResponsesToMulticastBroadcast" "1" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PublicProfile" "DefaultInboundAction" "1" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PublicProfile" "DefaultOutboundAction" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PublicProfile" "AllowLocalIPsecPolicyMerge" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PublicProfile" "AllowLocalPolicyMerge" "0" "DWORD" 
createKey "HKLM:\Software\Policies\Microsoft\WindowsFirewall" "PublicProfile" "DisableNotifications" "0" "DWORD" 