[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem})]
    [string]$Path,

    [ValidateRange(1,100)]
    [int]$FileCount = 9,

    [ValidateRange(1,100)]
    [int]$DirCount = 4,

    [switch]$force
)
#function start
function New-TestFiles
{
    [cmdletBinding()]
    param(
        [ValidateRange(1,100)]
        [int]$filecount,
        [ValidateScript({Test-Path -Path $PSItem})]
        [string]$filepath
    )
    if($filepath.EndsWith("\") -ne $true)
    {
        $filepath =$filepath + "\" 
    }

    for($i = 1; $i -le $filecount; $i ++)
    {
        Write-Progress -Id 2 -Activity "Erstelle Datei" -Status "Datei $i von $filecount" -PercentComplete ((100/$filecount) * $i)

        $filenumber = "{0:D3}" -f $i
        $path = $filepath + "File$filenumber.txt"
        New-Item -Path $path -ItemType File -Value (Get-Process | Get-Random | Format-List -Property * | Out-String)
    } 
}

#function ende


if($path.EndsWith("\") -eq $false)
{
    $path = $Path + "\"
}

$Testfilespath = $Path + "Testfiles"

if((Test-Path -Path $Testfilespath))
{#Wenn Ordner bereits vorhanden
    if($force)
    {#Wenn Parameter Force mit angegegben wurde. Löschen des Ordner Inhalts
        Get-ChildItem -Path $Testfilespath -Recurse | Remove-Item -Force -Recurse
    }
    else
    {
        throw "Ordner bereits vorhanden"
    }
}
else
{
    New-Item -Path $Testfilespath -ItemType Directory
}

Write-Progress -id 1 -Activity "Erstelle Ordner" -Status "Ordner 0 von $DirCount" -PercentComplete (1)

New-TestFiles -filepath $Testfilespath -filecount $FileCount 
#Schleife zum erstellen der Ordner
for($i = 1 ; $i -le $DirCount; $i++)
{
    Write-Progress -id 1 -Activity "Erstelle Ordner" -Status "Ordner $i von $DirCount" -PercentComplete ((100/$DirCount) * $i)

    $dirnumber = "{0:D3}" -f $i
    $dirpath = "$Testfilespath\Ordner$dirnumber"
    New-Item -Path $dirpath -ItemType Directory

    New-TestFiles -filepath $dirpath -filecount $FileCount 
}
Write-Progress -Completed -Activity "Erstelle Ordner"