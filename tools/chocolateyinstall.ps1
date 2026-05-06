$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$url = 'https://github.com/firezone/firezone/releases/download/gui-client-1.5.12/firezone-client-gui-windows_1.5.12_x86_64.msi'

Write-Host "NOTE: This is an UNOFFICIAL, community-maintained Chocolatey package for Firezone."
Write-Host "It is not maintained or endorsed by Firezone and may lag behind official releases."

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Firezone'

  checksum      = 'EECA0F84F8CE67EE7A69FD58193F147D8B1D2A906CC172D3474335E2C62E0205'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs