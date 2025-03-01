# Change to the directory of the script
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Get the list of .json files in the parent directory
$jsonFiles = Get-ChildItem -Path .. -Filter *.json -File -ErrorAction SilentlyContinue

# Function to confirm the action with the user
function Confirm-Action {
    $message = @"
Привет! Этот скрипт поможет скопировать путь до библиотеки Zotero. Чтобы это сделать, убедитесь, что:
1. Вы экспортировали библиотеку Zotero в папку Service
2. Файл называется латинскими символами и в его названии нет пробелов (!)

Если библиотек больше одной, выберите нужную, указав её номер и нажав Enter.

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

# Check if there are any .json files
if ($jsonFiles.Count -eq 0) {
    Write-Host "`n→ Файл библиотеки Zotero в формате JSON не найден 🤔. Экспортируйте библиотеку из Zotero, как это показано в уроке 1.5. Чтобы перейти на платформу и посмотреть урок, нажмите Enter. Для отмены нажмите Esc."

    # Read user input
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.VirtualKeyCode -eq 27) { # Esc key
        Write-Host "Отмена..."
        exit
    }

    if ($key.VirtualKeyCode -eq 13) { # Enter key
        # Open the Zotero Style Repository in the default browser
        Start-Process "https://konspekt.zenclass.ru/courses/731e4edc-9279-40a8-ad40-668820810803/edit/structure/lessons/29287a9c-a081-49c8-8d48-29cb2ff6c0d6"
    } else {
        Write-Host "Неверный ввод. Отмена..."
        exit
    }
}

# If there is only one .json file, use that
if ($jsonFiles.Count -eq 1) {
    $jsonFile = $jsonFiles[0]
} else {
    # Prompt the user to choose a .json file
    Write-Host "Найдено несколько файлов. Выберите нужный:"
    $i =
