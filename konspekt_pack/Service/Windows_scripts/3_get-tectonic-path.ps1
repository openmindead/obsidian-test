# Get the path of the Tectonic executable
$tectonicPath = Get-Command tectonic -ErrorAction SilentlyContinue

if ($tectonicPath) {
    # Copy the path to the clipboard
    Set-Clipboard -Value $tectonicPath.Source
    Write-Host "Скопировано! Можно вставлять в настройки плагина Pandoc в Obsidian 🙌"
} else {
    Write-Host "Tectonic не найден. Убедитесь, что он установлен."
}
