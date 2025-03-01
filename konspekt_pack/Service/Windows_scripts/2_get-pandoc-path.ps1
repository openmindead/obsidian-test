# Get the path of the Pandoc executable
$pandocPath = Get-Command pandoc -ErrorAction SilentlyContinue

if ($pandocPath) {
    # Copy the path to the clipboard
    Set-Clipboard -Value $pandocPath.Source
    Write-Host "Скопировано! Можно вставлять в настройки плагина Pandoc в Obsidian 🙌"
} else {
    Write-Host "Pandoc не найден. Убедитесь, что он установлен."
}
