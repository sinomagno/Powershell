Clear-Host 

$fecha = $(Get-Date -UFormat "%d-%m-%Y %H%M") 

#Path where the log file is save 

$pathlog = "C:\ValidatePolicyExec $env:COMPUTERNAME $fecha.log" 
 
#Function that change the key value in Register 
Function Validate_registry ([String]$Regkey, [String]$value, [string]$ItemProper) 
{ 
    #Get the item property that has the Key register and assign it to $val 
    $val =  Get-ItemProperty -Path $RegKey $ItemProper 

    #Compare if the value need it exist in the Register 
    #If the value not equal assign change it to the desire value and save the change in Log.  
    #Else Write in the log saying that the value is ok 

    if ((Get-ItemProperty $Regkey).$ItemProper) 
    { 
	if ($val.$ItemProper -ne $value) 
    	{      
        	set-itemproperty -path $RegKey -name $ItemProper -value $value  
	        echo "The value was change " |out-file -append $pathlog 
	} 
    	else 
	{ 
        	echo "The value is correct " | out-file -append $pathlog 
        	"The value of the Reg Key " + $Regkey + "\" + $ItemProper + " was the correct"  | out-file -append $pathlog 
	}
    } 
    else
    {
	new-itemproperty -path $RegKey -name $ItemProper -value $value -PropertyType "DWord"
	 "The Reg Key " + $Regkey + "\" + $ItemProper + " was created "  | out-file -append $pathlog 
    }
    
    # Write in the log the final value in the Register 
    $val =  Get-ItemProperty -Path $RegKey -name $ItemProper 
    echo $val | out-file -append $pathlog 
} 

Validate_registry (join-path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel" "Desktop") "1" "ScreenSaveActive" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "0" "UndockWithoutLogon" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "0" "ShutdownWithoutLogon" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "0" "DisableCAD" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "0" "EnableUIADesktopToggle" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "0" "ValidateAdminCodeSignatures" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "DontDisplayLastUserName" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "FilterAdministratorToken" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "EnableInstallerDetection" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "EnableSecureUIAPaths" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "EnableLUA" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "PromptOnSecureDesktop" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "1" "EnableVirtualization" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "10" "MaxDevicePasswordFailedAttempts" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "900" "InactivityTimeoutSecs" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" "0" "ConsentPromptBehaviorUser" 
Validate_registry "HKLM:\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers" "1" "AuthenticodeEnabled" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" "0" "SecurityLevel" 
Validate_registry "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" "0" "SetCommand" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy" "0" "Enabled" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" "537395200" "NTLMMinClientSec" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" "537395200" "NTLMMinServerSec" 
Validate_registry "HKLM:\Software\Policies\Microsoft\Messenger\Client" "1" "PreventAutoRun" 
Validate_registry "HKLM:\Software\Policies\Microsoft\Messenger\Client" "1" "PreventRun" 
Validate_registry "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" "0" "AlwaysInstallElevated" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate\AU" "1" "NoAUShutdownOption" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate\AU" "1" "NoAUAsDefaultShutdownOption" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate\AU" "1" "AUPowerManagement" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate\AU" "0" "AutoInstallMinorUpdates" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate\AU" "1" "NoAutoRebootWithLoggedOnUsers" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate\AU" "5" "RebootWarningTimeout" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Session Manager\Memory Management" "0" "ClearPageFileAtShutdown" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" "1" "ObCaseInsensitive" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "0" "AllocateCDRoms" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "0" "AutoAdminLogon" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "0" "Allocatefloppies" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "1" "ForceUnlockLogon" 
Validate_registry "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" "2" "CachedLogonsCount" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "14" "PasswordExpiryWarning" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "1" "SCRemoveOption" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "5" "ScreenSaverGracePeriod" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" "1" "RequireSignOrSeal" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" "1" "SealSecureChannel" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" "1" "SignSecureChannel" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" "1" "RequireStrongKey" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" "0" "DisablePasswordChange" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Eventlog\Security" "90" "WarningLevel" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" "0" "EnablePlainTextPassword" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" "1" "RequireSecuritySignature" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" "1" "EnableSecuritySignature" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" "1" "RequireSecuritySignature" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" "1" "EnableSecuritySignature" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "1" "EnableForcedLogoff" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\LanmanServer\Parameters" "1" "AutoShareServer" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Lanmanserver\Parameters" "1" "Hidden" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "1" "RestrictNullSessAccess" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" "8" "autodisconnect" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\LanmanServer\Parameters" "0" "SmbServerNameHardeningLevel" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" "" "NullSessionPipes" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\NTDS\Parameters" "2" "LDAPServerIntegrity" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" "1" "EnableICMPRedirect" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" "2" "DisableIPSourceRouting" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" "0" "PerformRouterDiscovery" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "5" "TcpMaxDataRetransmissions" 
Validate_registry "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" "2" "DisableIpSourceRouting" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" "5" "TcpMaxDataRetransmissions" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\LSA\MSV1_0" "0" "allownullsessionfallback" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\LSA\pku2u" "0" "AllowOnlineID" 
Validate_registry "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" "2" "AllocateDASD" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" "1" "AddPrinterDrivers" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar" "" "OverrideMoreGadgetsLink" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar" "1" "TurnOffSidebar" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar" "1" "TurnOffUserInstalledGadgets" 
Validate_registry "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar" "1" "TurnOffUnsignedGadgets" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "0" "AuditBaseObjects" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "0" "FullPrivilegeAuditing" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "0" "CrashOnAuditFail" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "0" "EveryoneIncludesAnonymous" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "1" "LimitBlankPasswordUse" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "1" "SCENoApplyLegacyAuditPolicy" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\LSA" "1" "SubmitControl" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "1" "RestrictAnonymousSAM" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "1" "RestrictAnonymous" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "1" "DisableDomainCreds" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\LSA" "1" "UseMachineId" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "1" "NoLMHash" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Lsa" "0" "ForceGuest" 
Validate_registry "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" "5" "LmCompatibilityLevel" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Session Manager" "1" "SafeDllSearchMode" 
Validate_registry "HKLM:\Software\Microsoft\Windows\WindowsUpdate" "0" "ElevateNonAdmins" 
Validate_registry "HKLM:\System\CurrentControlSet\Control\Session Manager" "1" "ProtectionMode" 
Validate_registry "HKLM:\Software\Policies\Microsoft\Cryptography" "2" "ForceKeyProtection" 