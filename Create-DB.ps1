param (
    [string]$pgHost,
    [int]$pgPort,
    [string]$pgUser,
    [string]$dbName,
    [string]$sqlFilePath
)

$pgPassword = Read-Host -Prompt "Enter PostgreSQL password:" -AsSecureString
$pgPasswordPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pgPassword))

$env:PGPASSWORD = $pgPasswordPlain

Write-Output "psql -h $pgHost -p $pgPort -U $pgUser -c 'CREATE DATABASE $dbName;'"
psql -h $pgHost -p $pgPort -U $pgUser -c "CREATE DATABASE $dbName;"

Write-Output "psql -h $pgHost -p $pgPort -d $dbName -U $pgUser -a -f '$sqlFilePath'"
psql -h $pgHost -p $pgPort -d $dbName -U $pgUser -a -f "$sqlFilePath"

$env:PGPASSWORD = $null
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pgPassword))
