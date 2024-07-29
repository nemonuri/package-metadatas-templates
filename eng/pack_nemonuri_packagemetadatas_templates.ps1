$projectName = 'Nemonuri.PackageMetadatas.Templates.csproj'

$workspace = Split-Path -Path $PSScriptRoot -Parent
$project = Get-ChildItem -Path $workspace -Recurse -Filter $projectName | Select-Object -First 1 # -Property FullName | Out-String -Stream

if (!$project) {
    Write-Error "Cannot Find $projectName"
    exit 1
}

dotnet pack $project