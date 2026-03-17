$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName

$url = 'https://www.firezone.dev/dl/firezone-client-gui-windows/latest/x86_64'

Write-Host "NOTE: This is an UNOFFICIAL, community-maintained Chocolatey package for Firezone."
Write-Host "It is not maintained or endorsed by Firezone and may lag behind official releases."

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Firezone'

  checksum      = 'EF33C1CDF1CB5F8546B85A8D901F0C1B6866661219D9E545D09854DFE1ADA406'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs