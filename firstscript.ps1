md C:\USER_LOGS
md C:\scripts
Copy-Item .\changedomainuserpw.ps1 -Destination C:\scripts
Copy-Item .\checkfornewusers.ps1 -Destination C:\scripts
cd C:\scripts
& .\changedomainuserpw.ps1

$task = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-executionpolicy bypass -noprofile -file c:\scripts\checkfornewusers.ps1'
$interval = New-TimeSpan -Minutes 5
$starttime = (Get-Date).AddMinutes(1)
$trigger = New-ScheduledTaskTrigger -Once -At $starttime -RepetitionInterval $interval
Register-ScheduledTask -Action $task -Trigger $trigger -TaskName CheckForNewUsers