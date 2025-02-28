param (
    [string]$name
)

if (-not $name) {
    $name = Read-Host "Please enter your name"
}

Write-Output "Hello $name"
