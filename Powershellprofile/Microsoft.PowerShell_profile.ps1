
function Set-ShellDefaultColors
{
    [cmdletBinding()]
    param(
    )

    $Host.UI.RawUI.BackgroundColor = "White"
    $Host.UI.RawUI.ForegroundColor = "Black"
    $Host.ui.RawUI.WindowTitle = "Powershell $($PSVersionTable.PSVersion.Major)"

    if((Get-Command -Name Set-PSReadlineOption).Version.Major -lt 2)
    {
        Write-Verbose -Message "OS = Server2016 oder Windows 10 1803 oder geringer"

        Set-PSReadlineOption -TokenKind Command -ForegroundColor DarkBlue
        Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Blue
        Set-PSReadlineOption -TokenKind Number -ForegroundColor DarkRed
        Set-PSReadlineOption -TokenKind Member -ForegroundColor DarkGray
        Set-PSReadlineOption -TokenKind Comment -ForegroundColor Green
    }
    else
    {
        Write-Verbose -Message "PSreadline V2 ab Windows 10 1809 / Server2019"

        Set-PSReadlineOption -Colors  @{
                                        "Parameter" =  [ConsoleColor]::Blue
                                        "Number" = [ConsoleColor]::DarkRed
                                        "Command" = [ConsoleColor]::DarkBlue
        
                                        }
    }
    Clear-Host
}
Set-ShellDefaultColors

function prompt
{
    $currentprincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $adminstatus = $currentprincipal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    if($adminstatus)
    {
        $UserState = "[A]"
    }
    else
    {
        $UserState = "[U]"
    }
    $nestedlevel = "PS>"
    for($i = 0; $i -lt $NestedPromptLevel;$i++)
    {
        $nestedlevel += ">"
    }

    Write-Host "$(Get-Location) | $($env:COMPUTERNAME)"
    "$UserState $nestedlevel"
}