# Configure ScreenSaveActive, NoDispScrSavPage, ScreenSaveTimeOut

Clear-Host 

$fecha = $(Get-Date -UFormat "%d-%m-%Y %H%M") 
reg export HKCU C:\"HKCU $fecha".reg 

#Path where the log file is save 

$pathlog = "C:\scripts\ImagenCorporativa $fecha.log" 

#Function that change the key value in Register 

Function Corporative_image ([String]$Regkey, [String]$value, $ItemProper) 
{ 
    #Get the item property that has the Key register and assign it to $val 
    $val =  Get-ItemProperty -Path $RegKey $ItemProper 

    #Compare if the value need it exist in the Register 
    #If the value not equal assign change it to the desire value and save the change in Log.  
    #Else Write in the log saying that the value is ok 
    if ($val -eq $null) 
    { 
        new-itemproperty -path $RegKey -name $ItemProper -value $value -PropertyType "DWord" 
        echo "Valor creado en ruta "+ $regKey | out-file -append $pathlog 
    } 
    elseif ($val.$ItemProper -ne $value) 
    { 
        set-itemproperty -path $RegKey -name $ItemProper -value $value  
        echo "The value was change " |out-file -append $pathlog 
    } 
    else 
    { 
        echo "The value is correct " | out-file -append $pathlog 
    } 

    #Write in the log the final value in the Register 
    $val =  Get-ItemProperty -Path $RegKey -name $ItemProper 
    echo $val | out-file -append $pathlog 
} 

Clear-host 
Corporative_image (join-path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel" "Desktop") "1" "ScreenSaveActive" 
Clear-host 
Corporative_image (join-path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel" "Desktop") "1" "NoDispScrSavPage" 
Clear-host 
Corporative_image (join-path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel" "Desktop") "300" "ScreenSaveTimeOut" 
Clear-host 
Corporative_image (join-path "HKCU:\Control Panel" "Desktop") "1" "ScreenSaveActive" 
Clear-host 
Corporative_image (join-path "HKCU:\Control Panel" "Desktop") "1" "NoDispScrSavPage" 