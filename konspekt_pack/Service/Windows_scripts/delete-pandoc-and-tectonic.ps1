# Function to uninstall a program using Chocolatey
function Uninstall-Program {
    param (
        [string]$programName
    )

    # Check if the program is installed
    $installed = Get-Command $programName -ErrorAction SilentlyContinue

    if ($installed) {
        Write-Host "Uninstalling $programName..."
        choco uninstall $programName -y
    } else {
        Write-Host "$programName is not installed."
    }
}

# Uninstall Pandoc
Uninstall-Program -programName "pandoc"

# Uninstall Tectonic
Uninstall-Program -programName "tectonic"

Write-Host "Pandoc and Tectonic have been uninstalled."
