# Given a folder path, return all docs files in PDF format

$documents_path = 'C:\Users\pc\Documents\\WTP' 

$word_app = New-Object -ComObject Word.Application 

# This filter will find .doc as well as .docx documents 
Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object { 
    $document = $word_app.Documents.Open($_.FullName) 
    $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf" 
    $document.SaveAs([ref] $pdf_filename, [ref] 17)  
    $document.Close() 
} 

$word_app.Quit() 