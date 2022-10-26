@echo off
chcp 1252 > nul
Title Criar Pastas para cada arquivo

:: Bat para criar uma pasta para cada aruqivo existente em uma pasta
Set "Tipo=*.*"

IF /i exist "%~1" (set "Pasta=%~1") else (set /p "Pasta=Por favor informe o caminho\nome da pasta: ")

set "Pasta=%Pasta:"=%"
for /f "Delims=" %%a in ('echo "%Pasta%"') do set "Pasta=%%~a"
IF /i not exist "%Pasta%" exit

pushd "%pasta%"
for /f "delims=" %%a in ('dir /b /a-d /s "%Tipo%"') do (
IF /i not Exist "%%~na" md "%%~dpna"
move "%%a" "%%~dpna" > nul
)
popd
exit