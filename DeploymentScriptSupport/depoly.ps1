Connect-AzAccount
Connect-AzureAD

$user = Get-AzureADUser -Filter "startswith(userPrincipalName, 'admin')" | Select-Object -First 1

# Extract the domain from the user's UPN and store it in UPN_SUFFIX
if ($user) {
    $UPN_SUFFIX = ($user.UserPrincipalName -split '@')[1]
    Write-Output "UPN Suffix: $UPN_SUFFIX"
} else {
    Write-Output "No user with UPN starting with 'admin' found."
}

$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "#8a7&me6EKmb#8mEe9zo"
$PasswordProfile.ForceChangePasswordNextLogin = $false
$username = "student@" + $UPN_SUFFIX
New-AzureADUser -DisplayName "Hacker Student" -PasswordProfile $PasswordProfile -UserPrincipalName $username -AccountEnabled $true -MailNickName "StudentHacker"

$newUserId = (Get-AzADUser -DisplayName "Hacker Student").Id

$AzureSub = (Get-AzContext).Subscription.Id
$scope = "/subscriptions/" + $AzureSub

#Start-Sleep -Seconds 20

New-AzRoleAssignment -ObjectId $newUserId -RoleDefinitionName "Owner" -Scope $scope

## DOWNLOADING JSON FILES
$sentinelrepoUrl = "https://github.com/nephoseu/SC200Twisted/raw/refs/heads/main/DeploymentScriptSupport/deploySentinel.json"
$templatePathSentinel = "deploySentinel1.json"
$MDCrepoUrl = "https://github.com/nephoseu/SC200Twisted/raw/refs/heads/main/DeploymentScriptSupport/deploySentinel.json"
$templatePathMDC = "deployMDC.json"
$location = "swedencentral"

# Download the ARM Template
Invoke-WebRequest -Uri $sentinelrepoUrl -OutFile $templatePathSentinel
Invoke-WebRequest -Uri $MDCrepoUrl -OutFile $templatePathMDC

#Deploying MDC

$templateFile = $templatePathMDC  # Update with the actual path to your ARM template
$deploymentName = "MDCDeployment"
$resourceGroupName = "rgSentinel"

az deployment group create `
    --name $deploymentName `
    --resource-group $resourceGroupName `
    --template-file $templateFile `
    --parameters location=$location

#Deploying Sentinel

# Define variables
$resourceGroupName = "rgSentinel"
#$location = "swedencentral"
$templateFile = $templatePathSentinel  # Update with the actual path to your ARM template
$deploymentName = "SentinelDeployment"

# Create a resource group (if it doesn’t exist)
az group create --name $resourceGroupName --location $location

# Deploy the ARM template
az deployment group create `
    --name $deploymentName `
    --resource-group $resourceGroupName `
    --template-file $templateFile `
    --parameters location=$location workspaceName="lawSentinel" sentinelName="socSentinel"

Write-Host "Deployment of Sentinel completed successfully!"


##
# Accept Windows 10/11 License Eligibility for Multi-Tenant Hosting Rights
az vm image terms accept --publisher MicrosoftWindowsDesktop --offer windows-11 --plan win11-24h2-ent

# Create Resource Group
az group create --name rgVirtualMachines --location $location

# Create Virtual Machine
az vm create `
  --resource-group rgVirtualMachines `
  --name Win11VM `
  --image MicrosoftWindowsDesktop:windows-11:win11-24h2-ent:latest `
  --admin-username demouser `
  --admin-password 'Pa$$w0rd1234' `
  --license-type "Windows_Client" `
  --size Standard_D2s_v3 `
  --public-ip-sku Standard `
  --nsg-rule RDP

# Enable RDP (TCP 3389) explicitly if needed
az network nsg rule create `
  --resource-group rgVirtualMachines `
  --nsg-name Win11VMNSG `
  --name AllowRDP `
  --protocol Tcp `
  --direction Inbound `
  --priority 1000 `
  --source-address-prefixes '*' `
  --source-port-ranges '*' `
  --destination-address-prefixes '*' `
  --destination-port-ranges 3389 `
  --access Allow

# Create Automatic Shutdown Schedule at 01:00 CET (Zagreb timezone)
az vm auto-shutdown `
  --resource-group rgVirtualMachines `
  --name Win11VM `
  --time 01:00 `
  --time-zone "Central Europe Standard Time"

# Output Public IP
$publicIP = az vm show -d --resource-group rgVirtualMachines --name Win11VM --query publicIps -o tsv
Write-Output "Public IP Address: $publicIP"

#bash
