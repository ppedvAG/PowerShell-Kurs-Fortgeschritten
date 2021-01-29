@{
    AllNodes = @(
        @{
            NodeName = "Member1"
            WindowsFeature = @(
                @{
                    Name = "Web-server"
                    Ensure = "present"
                },
                @{
                    Name = "Web-mgmt-tools"
                    Ensure = "present"
                }
                               )
          }
    )
}
# Speichert ConfigurationData in einer Datei mit der Dateierweiterung "PSD1".