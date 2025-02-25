@echo off

powershell.exe -Command "Enable-ScheduledTask -TaskName 'Mining Manager'"
powershell.exe -Command "Start-ScheduledTask -TaskName 'Mining Manager'"

exit 0;
