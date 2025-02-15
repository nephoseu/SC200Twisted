# Testing the App Reputation by SmartScreen

## Following excersise needs to be run on your Virtual Mahcine, NOT your production machine!


1. Open Microsoft Edge and navigate to: https://demo.smartscreen.msft.net/download/known/freevideo.exe
2. This is going to open a download dialog and this trusted application can be downloaded
3. Open Microsoft Edge and navigate to: https://demo.smartscreen.msft.net/download/unknown/freevideo.exe
3. Microsoft SmartScreen will provide notification about unknown file and will allow user to choose if the file should be downloaded or not
4. Open Microsoft Edge and navigate to: https://demo.smartscreen.msft.net/download/known/knownmalicious.exe
5. Microsoft SmartScreen will prevent user from dowloading file

### Those exemples won't raise alert in the Microsoft Defender portal. Settings about behaviour of the SmartScreen can be configured on every endpoint