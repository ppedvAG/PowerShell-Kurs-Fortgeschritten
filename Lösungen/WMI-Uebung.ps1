#Aufgabe1
Get-CimClass -Namespace root\cimv2 
#oder
Get-WmiObject -Namespace root\cimv2 -List

#Aufgabe2
Get-WmiObject -Class Win32_LogicalDisk
#oder
Get-CimInstance -ClassName Cim_PhysicalMemory

#Aufgabe3
Get-CimInstance -ClassName Win32_OperatingSystem | Format-List -Property *
#oder
Get-WmiObject -Class Win32_OperatingSystem | Format-List -Property *

#Aufgabe4
$session = New-CimSession -ComputerName Member -Credential ppedv\Administrator
Get-CimInstance -CimSession $session -ClassName Win32_LogicalDisk