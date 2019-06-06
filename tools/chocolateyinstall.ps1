$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"
. "$toolsDir\dependenciesEnv.ps1"

$url        = 'https://hendricks266.duke4.net/files/3dduke13_data.7z'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  softwareName  = '3dduke-shareware*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'AF2D24A2FF71DD10B0118AADCBF95831'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512
}
Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutDesktop" `
  -TargetPath "$engineLocation\eduke32.exe" `
  -IconLocation "$engineLocation\eduke32.exe" `
  -WorkingDirectory "$installLocation"
