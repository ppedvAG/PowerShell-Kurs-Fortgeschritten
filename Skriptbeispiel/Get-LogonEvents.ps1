param(
[string]$Computername = "localhost", #Parameter mit Defaultwert

[Parameter(Mandatory=$true)] #Fügt dem Parameter erweiterte Eigenschaften hinzu, wie zb Mandatory um es zu einem Pflicht parameter zu machen
[int]$EventId  ,

[int]$Newest = 10 # Parameter mit Defaultwert
)

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest


