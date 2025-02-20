# Testing the Antimalware Scan Interface (AMSI)

## Following excersise needs to be run on your Virtual Mahcine, NOT your production machine!


1. Download amsi.ps1 from GitHub Repo in the folder AMSI
2. Open PowerShell as administrator
3. Navigate to the downloaded file amsi.ps1 and run it
4. You should see notification from Windows Security as it prevented executing malicious file
5. Download AMSI.vbs
6. From the same PowerShell run "WScript AMSI.vbs"
7. You should see notification from Windows Security as it prevented executing malicious file
8. In Microsoft Security (security.microsoft.com) you should see one incident and couple of alerts. Explore them. See the anatomy of the incident and alerts. Explore options for isolating files, collecting evidence
9. On the virtual machine, in the PowerShell run command Get-MpThreat and explore output
10. Validate that in the file structure malicious AMSI.vbs file was automatically removed by Windows Security center