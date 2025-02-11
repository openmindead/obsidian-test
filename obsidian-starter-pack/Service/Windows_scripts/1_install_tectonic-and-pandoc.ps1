function Confirm-Installation {
    $key = Read-Host -Prompt "`nПривет! 🙌`n`nЭто скрипт-помощник «Конспекта», который установит утилиты Tectonic и Pandoc, нужные для конвертации документов в PDF, docx и веб-страницы.`n`nНажмите Enter, чтобы продолжить, или Esc, чтобы отменить: " -AsSecureString
    if ($key.Length -eq 0) {
        return $true
    } else {
        return $false
    }
}

# Check if the user wants to proceed with the installation
if (-not (Confirm-Installation)) {
    Write-Host "Вы отменили установку (︶︹︶)"
    exit 1
}

# Check if Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey не найден. Установка Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Tectonic
if (Get-Command tectonic -ErrorAction SilentlyContinue) {
    Write-Host "`n → Tectonic уже установлен, ура! Это значит, что его не нужно устанавливать и можно начать им пользоваться!"
} else {
    Write-Host "`n → Установка Tectonic..."
    choco install tectonic -y
}

# Install Pandoc
if (Get-Command pandoc -ErrorAction SilentlyContinue) {
    Write-Host "`n → Pandoc тоже уже установлен, а это значит, что им тоже можно начать пользоваться!"
} else {
    Write-Host "`n → Установка Pandoc..."
    choco install pandoc -y
}

Write-Host "`n → Tectonic и Pandoc успешно установлены и готовы к работе! Хорошего дня! 🙃"
