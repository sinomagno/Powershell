# Change the thumbprint for the information of your certificate

" "; hostname; date ;gci -path "cert:/LocalMachine/My/Thumbprint" | select * ;  gci cert:\LocalMachine\My\Thumbprint | %{$_.PublicKey.Key} 