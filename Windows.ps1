write "Changing Password"
net user justinpelletier OmarAbdulLatif@6969 | write "New password for the user"


write "Create a backup user"
New-LocalUser -Name tafa-cmd -Password GoDieZaytoon | write "New user have been added" 


write "Saving Services & Process"
Get-Process | Out-File -FilePath 'C:\Program Files\process.txt'
Get-Service | Out-File -FilePath 'C:\Program Files\services.txt'
