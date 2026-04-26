@echo off

cd /d "%~dp0colossus"
start "Colossus Engine" cmd /c "mvnw.cmd spring-boot:run"

echo Colossus Engine started.
echo Run colossus-stop.bat to stop.