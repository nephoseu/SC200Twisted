# Testing the Controlled Folder Access 

## Following excersise needs to be run on your Virtual Mahcine, NOT your production machine!


1. Download the file https://demo.wd.microsoft.com/Content/CFA_SetupScript.zip, extract it and run the file WindowsDefender_CFA_SetupScript.ps1 in elevated PowerShell as administrator. Script will create folder C:\Demo with necessarry files
2. Execute following command "Set-MpPreference -EnableControlledFolderAccess Enabled"
3. Execute following command "Set-MpPreference -ControlledFolderAccessProtectedFolders C:\demo"
4. Download following file: https://demo.wd.microsoft.com/Content/ransomware_testfile_unsigned.exe
5. Download will be protected by SmartScreen filter, but you are able to keep the file and save it
6. Execute file "ransomware_testfile_unsigned.exe" that will try to encrypt folder "C:\demo", but it should be prevented by Defender
7. Execute following command "Set-MpPreference -EnableControlledFolderAccess Disabled"
8. Execute file "ransomware_testfile_unsigned.exe" that will encrypt folder "C:\demo" because the Controlled Folder Access protection is disabled
9. Download the file https://demo.wd.microsoft.com/Content/ASR_CFA_CleanupScript.zip and extract it
10. Run the file WindowsDefender_ASR_CFA_CleanupScript.ps1 to decrypt and clean C:\Demo folder
11. Execute following command "Add-MpPreference -AttackSurfaceReductionRules_Ids C1DB55AB-C21A-4637-BB3F-A12568109D35 -AttackSurfaceReductionRules_Actions Enabled" to enable Aggressive Ransomware Protection ASR rule