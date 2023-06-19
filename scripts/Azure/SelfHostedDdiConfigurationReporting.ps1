#Teams PowerShell Authentication
$credentials = Get-AutomationPSCredential -Name 'LoopUpServiceAccountCredentials'
Connect-MicrosoftTeams -Credential $credentials

#Automation Account Variables
$luClientId = Get-AutomationVariable -Name "LoopUpClientId"
$luClientSecret = Get-AutomationVariable -Name "LoopUpClientSecret"
$luCustomerId = Get-AutomationVariable -Name "LoopUpCustomerId"
$filterOVRP = Get-AutomationVariable -Name "filterOVRP"

# Download script from GitHub
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/loopup/ct-integrated-reporting/feature/SHER-896/scripts/Common/SelfHostedDdiConfigurationReporting.ps1" -OutFile "$PSScriptRoot\SelfHostedDdiConfigurationReporting.ps1"

# Run script
& "$PSScriptRoot\SelfHostedDdiConfigurationReporting.ps1" $luClientId $luClientSecret $luCustomerId $filterOVRP

# Tidy up
Remove-Item "$PSScriptRoot\SelfHostedDdiConfigurationReporting.ps1"