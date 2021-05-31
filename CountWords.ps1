# Given a text file return the count that each word shown in the file.

$txt = gc "filepath text file" 
$path  = "C:\count.txt" 

out-file -filepath $path 

foreach ($txtno in ($txt.split(' ') | where {$_})) 
{ 
    $file = gc $path 
    if (-Not (Select-String -InputObject $file -pattern $txtno -SimpleMatch)){ 
        $count = (Select-String -InputObject $txt -pattern $txtno -AllMatches).Matches.Count 
        $txtno + " " + $count | out-file $path -Append 
    } 
} 