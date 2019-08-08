$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"
. "$toolsDir\dependenciesEnv.ps1"

$url        = 'https://hendricks266.duke4.net/files/3dduke13_data.7z'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  softwareName  = '3dduke-shareware*'
  checksum      = '3FCDC3CB4C16E44A6A15F9A916AE9D2F131DC6297B324FBD656DD404F2050DEC'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutDesktop" `
  -TargetPath "$(Join-Path $engineLocation eduke32).exe" `
  -WorkingDirectory "$installLocation"
