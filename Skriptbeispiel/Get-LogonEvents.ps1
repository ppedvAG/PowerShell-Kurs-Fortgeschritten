<#
.Synopsis
   Skript zum abfragen von Secuirity Events
.DESCRIPTION
   Skript mit dem folgende Events abgefragt werden können: Anmeldung, fehlgeschlagene Anmeldung, Abmeldung
.EXAMPLE
   Get-LogonEvents.ps1 -EventId 4624

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
    9315 Jan 28 15:03  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9312 Jan 28 15:03  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9309 Jan 28 15:03  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9306 Jan 28 15:02  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9303 Jan 28 15:02  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9300 Jan 28 15:01  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9295 Jan 28 15:00  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9292 Jan 28 15:00  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9288 Jan 28 15:00  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
    9286 Jan 28 15:00  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....

    Frägt die aktuellsten 10 Anmeldeevents vom lokalsystem ab
.EXAMPLE
   Ein weiteres Beispiel für die Verwendung dieses Cmdlets
.PARAMETER EventId
   Der Parameter definiert welche Events abgefragt werden. 
   4624 Anmeldung, 
   4625 fehlgeschlagene,
   Anmeldung 4634 Abmeldung
#>
[cmdletBinding()]
param(
[string]$Computername = "localhost", #Parameter mit Defaultwert

[Parameter(Mandatory=$true)] #Fügt dem Parameter erweiterte Eigenschaften hinzu, wie zb Mandatory um es zu einem Pflicht parameter zu machen
[int]$EventId  ,

[int]$Newest = 10 # Parameter mit Defaultwert
)

Write-Verbose -Message "Es wurde das Skript mit folgenden Werten geladen: Computername: $Computername , $EventId , $Newest"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest


