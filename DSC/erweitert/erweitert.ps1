configuration webserverconfig
{
    LocalConfigurationManager
    {
        #ApplyOnly
        #ApplyAndMonitor
        #ApplyAndAutoCorrect
        ConfigurationMode = "ApplyAndAutoCorrect"

        #in welchen Abständen soll die Konfiguration geprüft werden. Default und Mindestwert ist 15 Minuten
        ConfigurationModeFrequencyMins = 15
    }


    node $AllNodes.NodeName
    {
        foreach($Feature in $Node.WindowsFeature)
        {
            WindowsFeature $Feature.Name
            {
                Name = $Feature.Name
                Ensure = $Feature.Ensure
            }
        }      
    }
}

webserverconfig -configurationData C:\PowerShell-Kurs-Fortgeschritten\DSC\erweitert\DSCconfig.psd1 -OutputPath C:\PowerShell-Kurs-Fortgeschritten\DSC\erweitert\