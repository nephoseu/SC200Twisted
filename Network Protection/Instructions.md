# Testing the Network Protection

## Following excersise needs to be run on your Virtual Mahcine, NOT your production machine!


1. By using Microsoft Edge download and install Google Chrome or Mozilla Firefox
2. Try oppening website https://smartscreentestratings2.net/ in browser other than Microsoft Edge
3. Website will be oppened and malicious payload will be delivered
4. Open elevated PowerShell as Administrator and execute following command "Set-MpPreference -EnableNetworkProtection Enabled"
5. Close browser other than Edge and re-open it and try to navigate to https://smartscreentestratings2.net/ URL
6. This time, Microsoft Defender will block malicious content based on the Network Protection Rules
