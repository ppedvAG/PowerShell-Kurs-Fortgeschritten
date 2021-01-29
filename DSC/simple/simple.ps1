Configuration WebServerConfiguration
{
    Node "Member1"
    {
        WindowsFeature WebServer
        {
            Name = "Web-Server"
            Ensure = "Present"
        }
        WindowsFeature Webmgmt
        {
            Name = "Web-Mgmt-Tools"
            Ensure = "Present"
        }
        WindowsFeature DefaultDoc
        {
            Name = "Web-Default-Doc"
            Ensure = "Present"
        }
    }
}
#Configuration ausführen dann folgender Befehl
#WebServerConfiguration -OutputPath C:\PowerShell-Kurs-Fortgeschritten\DSC\simple
#starten der dsc
# start-dscconfiguration -path  C:\PowerShell-Kurs-Fortgeschritten\DSC\simple