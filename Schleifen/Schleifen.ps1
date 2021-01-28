#ForSchleife
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
}#While schleifewhile(($Eingabe = Read-Host -Prompt "Soll ich weitermachen") -eq "Ja") #Bedingung im schleifenkopf kann auch ein cmdlet sein zb{    #Schleifenkörper    Write-Host -Object "Ein weiterer Durchlaufe" -ForegroundColor (Get-random -Minimum 1 -Maximum 16)}#Fußgeprüften Schleifendo #schleifenkeyword{    $i += 1    $i}while($i -lt 5) #Prüfung am SchleifenFuß solange Prüfung true ergibt#zb remoteinstallation mit neustartdo{    Start-Sleep -Seconds 20}until(Test-NetConnection -ComputerName "Computername" -CommonTCPPort WINRM -InformationLevel Quiet) #Prüfung am Schleifenfuß solange Prüfung false ergibt#abbruch innerhalb von schleifen mit break