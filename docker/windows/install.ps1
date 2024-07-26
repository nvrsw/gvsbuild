#
# Copyright (c) 2024 EMSTONE, All rights reserved.
#

# Stop immediately if any error happens
$ErrorActionPreference = "Stop"

# Enable all versions of TLS
[System.Net.ServicePointManager]::SecurityProtocol = @("Tls12","Tls11","Tls","Ssl3")

# Download Visual Studio 2019 Community edition
$msvs_url = "${env:MSVS_URL}/${env:MSVS_VERSION}/release/${env:MSVS_DIST_NAME}"
$msvs_dist = "${env:TMP}\${env:MSVS_DIST_NAME}"
Write-Host "Downloading Visual Studio 2019 Community edition from ${msvs_url} into ${msvs_dist}"
(New-Object System.Net.WebClient).DownloadFile("${msvs_url}", "${msvs_dist}")

# Install Visual C++ part of Visual Studio 2019 Community edition
Write-Host "Installing Visual C++ part of Visual Studio 2019 Community edition"
$p = Start-Process -FilePath "${msvs_dist}" -ArgumentList `
  ("--locale en-US", `
   "--quiet", `
   "--norestart", `
   "--wait", `
   "--nocache", `
   "--add Microsoft.VisualStudio.Workload.NativeDesktop", `
    "--add Microsoft.VisualStudio.Workload.VCTools", `
   "--add Microsoft.VisualStudio.Component.Windows10SDK.18362", `
   "--includeRecommended") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to install Visual Studio 2019 Community edition"
}
Write-Host "Visual C++ part of Visual Studio 2019 (${env:MSVS_VERSION}) installed"

# Download and install Visual Studio Locator
$vswhere_url = "${env:VSWHERE_URL}/${env:VSWHERE_VERSION}/${env:VSWHERE_DIST_NAME}"
$vswhere_dist = "${env:SystemRoot}\${env:VSWHERE_DIST_NAME}"
Write-Host "Downloading Visual Studio Locator from ${vswhere_url} into ${vswhere_dist}"
(New-Object System.Net.WebClient).DownloadFile("${vswhere_url}", "${vswhere_dist}")
Write-Host "Visual Studio Locator ${env:VSWHERE_VERSION} installed"

# Download MSYS2
$msys2_url = "${env:MSYS2_URL}/${env:MSYS2_DIST_NAME}"
$msys2_dist = "${env:TMP}\${env:MSYS2_DIST_NAME}"
Write-Host "Downloading MSYS2 from ${msys2_url} into ${msys2_dist}"
(New-Object System.Net.WebClient).DownloadFile("${msys2_url}", "${msys2_dist}")

# Install MSYS2
Write-Host "Installing MSYS2"
$p = Start-Process -FilePath "${msys2_dist}" -ArgumentList `
("-y", `
    "-oC:\") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to install MSYS2"
}

# Rename link.exe to link_orig.exe in order to use MSVC link.exe
Move-Item -Path "C:\msys64\usr\bin\link.exe" -Destination "C:\msys64\usr\bin\link_orig.exe"

# Update MSYS2 packages
Write-Host "Updating MSYS2"
$p = Start-Process -FilePath "C:\msys64\usr\bin\bash.exe" -ArgumentList `
("-l", `
    "-c", `
    "'pacman --noconfirm -Sy make gcc diffutils nasm pkg-config git'") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to install MSYS2 build tools"
}

$p = Start-Process -FilePath "C:\msys64\usr\bin\bash.exe" -ArgumentList `
("-l", `
    "-c", `
    "' '") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to update MSYS2"
}
$p = Start-Process -FilePath "C:\msys64\usr\bin\bash.exe" -ArgumentList `
("-l", `
    "-c", `
    "'pacman --noconfirm -Syuu'") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to update MSYS2"
}
$p = Start-Process -FilePath "C:\msys64\usr\bin\bash.exe" -ArgumentList `
("-l", `
    "-c", `
    "'pacman --noconfirm -Syuu'") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to update MSYS2"
}
$p = Start-Process -FilePath "C:\msys64\usr\bin\bash.exe" -ArgumentList `
("-l", `
    "-c", `
    "'pacman --noconfirm -Scc'") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to update MSYS2"
}
Write-Host "MSYS2 (${env:MSYS2_DIST_NAME}) installed"

# Set python path
setx /M PATH "${env:PATH};C:\msys64\usr\bin"

# Download Python
$python_dist_name = "python-${env:PYTHON_VERSION}-amd64.exe"
$python_dist_url = "${env:PYTHON_URL}/${env:PYTHON_VERSION}/${python_dist_name}"
$python_dist = "${env:TMP}\${python_dist_name}"
Write-Host "Downloading Python ${env:PYTHON_VERSION} from ${python_dist_url} into ${python_dist}"
(New-Object System.Net.WebClient).DownloadFile("${python_dist_url}", "${python_dist}")

# Install Python
Write-Host "Installing Python ${env:PYTHON_VERSION} from ${python_dist} into ${env:PYTHON_HOME}"
$p = Start-Process -FilePath "${python_dist}" `
  -ArgumentList ("/exenoui", "/norestart", "/quiet", "/qn", "InstallAllUsers=1", "TargetDir=""${env:PYTHON_HOME}""") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to install Python ${env:PYTHON_VERSION}"
}
Write-Host "Python ${env:PYTHON_VERSION} installed into ${env:PYTHON_HOME}"

# Set python path
setx /M PATH "${env:PATH};${env:PYTHON_HOME}"

# Download 7z
$7z_url = "${env:7Z_URL}/${env:7Z_DIST_NAME}"
$7z_dist = "${env:TMP}\${env:7Z_DIST_NAME}"
Write-Host "Downloading 7z from ${7z_url} into ${7z_dist}"
(New-Object System.Net.WebClient).DownloadFile("${7z_url}", "${7z_dist}")

# Install 7z
Write-Host "Installing 7z"
$p = Start-Process -FilePath "${7z_dist}" -ArgumentList `
("/S", `
    "/D=c:\7zip") `
  -Wait -PassThru
if (${p}.ExitCode -ne 0) {
  throw "Failed to install 7z"
}
Write-Host "7z (${env:7Z_DIST_NAME}) installed"

# Set 7z path
setx /M PATH "${env:PATH};c:\7zip"

# Cleanup
Write-Host "Removing all files and directories from ${env:TMP}"
Remove-Item -Path "${env:TMP}\*" -Recurse -Force
