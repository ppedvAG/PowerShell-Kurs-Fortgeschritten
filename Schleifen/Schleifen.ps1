﻿#ForSchleife
for($i = 0;$i -le 10; $i++) #Schleifenkopf (Initilisierung Zählervariable;Durchführungsbedingung,Schrittweise)
{
    #Schleifenkörper
    $i
}

#Foreach Schleife nicht mit Foreach-Object verwechselnt. Foreach Schleife -> schneller, Foreach-Object -> weniger Speicher
#Die Objekt Eigenschaften und Menge kann während der Verarbeitung geändert werden.
$users = Get-ADUser -Filter *
foreach($user in $users)
{
    $user.NAme
}