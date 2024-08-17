Set-Location -Path $PSScriptRoot

# TODO: clean temporary files

dotnet new classlib --force
dotnet new pkgprop --force

$xElem = [System.Xml.Linq.XElement]::new([System.Xml.Linq.XName]"Import")
$xElem.SetAttributeValue([System.Xml.Linq.XName]"Project", "Directory.Pack.props")

$csprojPath = [System.IO.Path]::Combine($PSScriptRoot, "Nemonuri.Test.Dir4.csproj")
$csprojAllText = [System.IO.File]::ReadAllText($csprojPath)

$xDoc = [System.Xml.Linq.XDocument]::Parse($csprojAllText, [System.Xml.Linq.LoadOptions]::PreserveWhitespace)
$xDoc.Root.Add($xElem)

$xDoc.Save($csprojPath, [System.Xml.Linq.SaveOptions]::None)

dotnet pack