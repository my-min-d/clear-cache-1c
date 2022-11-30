# use on administrator

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}


get-localuser | select Name >> "~\Desktop\users.txt"

get-content "~\Desktop\users.txt"

rm "~\Desktop\users.txt"

$user = read-host "user name: "

Get-Process 1cv8 -includeusername | where UserName -CContains "$env:computername\$user" | stop-process



rm "C:\Users\$user\AppData\Local\1C" -r -fo

rm "C:\Users\$user\AppData\Roaming\1C\1cv8" -r -fo


start-sleep -s 15


