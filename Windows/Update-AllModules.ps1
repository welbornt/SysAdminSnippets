# Get all installed modules
$modules = Get-InstalledModule

# Iterate through each module
foreach ($module in $modules) {
    # Check if the module is up to date
    $latestVersion = (Find-Module -Name $module.Name).Version
    if ($module.Version -lt $latestVersion) {
        # If not, write a message to the user
        Write-Host "Module $($module.Name) is not up to date. Current version: $($module.Version) Latest version: $latestVersion"
        # Upgrade the module
        Write-Host "Updating $($module.Name)..."
        Update-Module -Name $module.Name -Force
        # Confirm the upgrade to the user
        Write-Host "Module $($module.Name) has been upgraded to version $latestVersion"
    } else {
        # If the module is up to date, inform the user
        Write-Host "Module $($module.Name) is up to date. Version: $($module.Version)"
    }
}
