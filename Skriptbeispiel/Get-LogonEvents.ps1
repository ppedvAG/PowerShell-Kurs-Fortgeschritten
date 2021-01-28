param(
$Computername,
$EventId ,
$Newest 
)
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest


