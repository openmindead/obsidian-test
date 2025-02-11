# Change to the directory of the script
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Get the list of .csl files in the parent directory
$cslFiles = Get-ChildItem -Path .. -Filter *.csl -File -ErrorAction SilentlyContinue

# Function to confirm the action with the user
function Confirm-Action {
    $message = @"
Привет! Этот скрипт поможет скопировать путь до нужного стиля цитирования. Чтобы это сделать, убедитесь, что:
1. Вы скачали стиль цитирования в папку Service с сайта [https://www.zotero.org/styles]
2. В названии стиля цитирования нет пробелов (!)

Если стилей цитирования больше одного, выберите нужный, указав его номер и нажав Enter.

Нажмите Enter, чтобы продолжить, и Esc, чтобы остановить:
"@
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.Character -eq [char]13) { # Enter key
        return $true
    } else {
        return $false
    }
}

# Check if the user wants to proceed with the action
if (-not (Confirm-Action)) {
    Write-Host "Вы отменили действие (︶︹︶)"
    exit 1
}

# Check if there are any .csl files
if ($cslFiles.Count -eq 0) {
    Write-Host "Файлы стилей цитирования не найдены. Хотите перейти на сайт для их загрузки? Нажмите Enter для продолжения или Esc для отмены."

    # Read user input
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown
