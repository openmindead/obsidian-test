# Change to the directory of the script
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Change to the target directory
$targetDirectory = "..\..\!Notes\Manuscripts\Output"
Set-Location -Path $targetDirectory -ErrorAction Stop

# Get the absolute path of the target directory
$absolutePath = (Get-Location).Path

# Copy the absolute path to the clipboard
Set-Clipboard -Value $absolutePath

# Check if Set-Clipboard succeeded
if ($?) {
    Write-Host "Путь скопирован! Теперь можно вернуться в настройки плагина Obsidian и вставить значение в поле Export Folder."
} else {
    Write-Host "Не удалось скопировать путь в буфер обмена."
}
