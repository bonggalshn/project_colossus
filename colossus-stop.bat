@echo off

echo Stopping Colossus Engine...

for /f "tokens=5" %%P in ('netstat -ano ^| findstr ":8080.*LISTENING"') do (
    taskkill /F /PID %%P >nul 2>&1
    echo Stopped process %%P
)

echo Done.