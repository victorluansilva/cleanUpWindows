@echo off
echo Procurando processos do Chrome...

for /f "tokens=2 delims=," %%i in ('tasklist /FI "IMAGENAME eq chrome.exe" /FO CSV /NH') do (
    :: echo Verificando se o processo com PID %%i ainda está em execução...
    tasklist /FI "PID eq %%i" | find "chrome.exe" >nul
    if not errorlevel 1 (
        echo Finalizando o processo com PID %%i...
        taskkill /F /PID %%i
    ) else (
        echo O processo com PID %%i já foi finalizado.
    )
)

:: echo Processos do Chrome finalizados.
:: echo Excluindo a pasta Chrome do AppData\Local...

rmdir /s /q "%LocalAppData%\Google\Chrome"
