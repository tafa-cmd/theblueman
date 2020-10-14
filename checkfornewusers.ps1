$When = ((Get-Date).AddMinutes(-6))
Get-ADUser -Filter {whenCreated -ge $When} -Properties whenCreated | Out-File -FilePath C:\USER_LOGS\log.txt