# Hardening Windows servers 
# Audit policies
# https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-gpac/77878370-0712-47cd-997d-b07053429f6d

clear-host  

Function Set_GetPolicy([String]$auditapol, [String]$YNS) 
{ 
    $audit = auditpol /get /subcategory:$auditapol 
    if ($YNS -eq "Auditar") 
    { 
        if (!($audit[4] -like "*Aciertos y errores*" -or $audit[4] -like "*Success and Failure*")) 
        { 
            auditpol /set /subcategory:$auditapol /failure:enable /success:enable 
            $audit = auditpol /get /subcategory:$auditapol 
        } 
        Else 
        { 
            echo "Rigth Policy" | out-file -append "c:\PolicyPorperty.log" 
        } 

        echo $audit | out-file -append "c:\PolicyPorperty.log" 
    } 
    elseif ($YNS -eq "No Auditar") 
    { 
        if (($audit[4] -like "*Aciertos y errores*" -or $audit[4] -like "*Success and Failure*")) 
        { 
            auditpol /set /subcategory:$auditapol /failure:disable /success:disable 
            $audit = auditpol /get /subcategory:$auditapol 
        } 
        Else 
        { 
            echo "Rigth Policy" | out-file -append "c:\PolicyPorperty.log" 
        } 
        echo $audit | out-file -append "c:\PolicyPorperty.log" 
     } 
     else 
     { 
        if (!($audit[4] -like "*Aciertos*" -or $audit[4] -like "*Success*")) 
        { 
            auditpol /set /subcategory:$auditapol /failure:disable /success:enable 
            $audit = auditpol /get /subcategory:$auditapol 
        } 
        Else 
        { 
            echo "Rigth Policy" | out-file -append "c:\PolicyPorperty.log" 
        } 

        echo $audit | out-file -append "c:\PolicyPorperty.log" 
     }   
} 

clear-Host 
 
Set_GetPolicy "{0CCE9214-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9212-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9211-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9210-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9213-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9219-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE921C-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9243-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9218-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9217-69AE-11D9-BED3-505054503030}" "Success" 
Set_GetPolicy "{0CCE9216-69AE-11D9-BED3-505054503030}" "Success" 
Set_GetPolicy "{0CCE921B-69AE-11D9-BED3-505054503030}" "Success" 
Set_GetPolicy "{0CCE921A-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9215-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9223-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE921E-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9244-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9227-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9226-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9225-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9224-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE921D-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9222-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9221-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9220-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE921F-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9229-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9228-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE922A-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE922E-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE922D-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE922C-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE922B-69AE-11D9-BED3-505054503030}" "Success" 
Set_GetPolicy "{0CCE9234-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9232-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9231-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9230-69AE-11D9-BED3-505054503030}" "Success" 
Set_GetPolicy "{0CCE922F-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9233-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9239-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9238-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE923A-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9235-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9236-69AE-11D9-BED3-505054503030}" "Success" 
Set_GetPolicy "{0CCE9237-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE923C-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE923D-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE923E-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE923B-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE923F-69AE-11D9-BED3-505054503030}" "Auditar" 
Set_GetPolicy "{0CCE9242-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9240-69AE-11D9-BED3-505054503030}" "No Auditar" 
Set_GetPolicy "{0CCE9241-69AE-11D9-BED3-505054503030}" "No Auditar" 