@echo off
set executable=C:\Windows\System32\calc.exe
REM    тут пропишите директорию до нужного приложения
set process=calculator.exe
REM    тут пропишите название процесса-приложения(вкладка "подробнее" в диспетчере)


taskkill /f /im %process% 

:begin
tasklist |>nul findstr /b /l /i /c:%process% 
if errorlevel 1 (
  start "" "%executable%"
 timeout /t 10 /nobreak >nul
REM   тут ничего не изменять
) else ( 
  timeout /t 20 /nobreak >nul
REM   тут тоже ничего не изменять
)
goto :begin