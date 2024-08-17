Set-Location -Path $PSScriptRoot
Write-Host "$((Get-Location).Path)"
dotnet new pkgprop -o "$((Get-Location).Path)"