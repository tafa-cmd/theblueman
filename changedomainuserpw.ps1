$users = @("bruceherring", "daryljohnson", "billstackpole", "garretacoraci", "robolson", "justinpelletier", "chaimsanders", "boyuan", "giovaniabuatiah")
$oldpass = "PleaseChange123!"
$newpass = "jazzyPl@nt70"

foreach ($user in $users) {
    Set-ADAccountPassword -Identity $user -OldPassword (ConvertTo-SecureString -AsPlainText $oldpass -Force) -NewPassword (ConvertTo-SecureString -AsPlainText $newpass -Force)
}

