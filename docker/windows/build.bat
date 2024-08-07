@echo off
rem
rem Copyright (c) 2024 EMSTONE, All rights reserved.
rem

setlocal

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
if exist "C:\Program Files\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=C:\Program Files\Microsoft Visual Studio\2019\Community"

if "%MSVC_ROOT%" == ""  goto missing_msvc
if not exist "%MSVC_ROOT%\VC\Auxiliary\Build\vcvarsall.bat" goto missing_file

if "%1" == "" goto usage

set Source=%1
set Arch=%2

echo "Build library with '%1 %2'"

set "MsvcArch=amd64"
if "%Arch%" == "x86" set "MsvcArch=x86"
call "%MSVC_ROOT%\VC\Auxiliary\Build\vcvarsall.bat" %MsvcArch%

chcp 437

call rmdir /S /Q C:\gtk-build\build
call python %Source%\build.py build lz4 openssl gtk librsvg libssh libuv libcurl libjpeg-turbo json-c -p "%Arch%" -c release --vs-ver 16

set "Output=C:\gtk-build\gtk\x64\release"
if "%Arch%" == "x86" set "Output=C:\gtk-build\gtk\Win32\release"
set "Target=%Source%\gtk\gtk-win64.7z"
if "%Arch%" == "x86" set "Target=%Source%\gtk\gtk-win32.7z"

mkdir %Source%\gtk
call 7z a %Target% %Output%\*

echo "Build done"
goto :end_local

:usage
echo Usage:
echo     %0 [source path] [arch]
echo Example:
echo     %0 C:\git\gvsbuild x86
goto :end_local

:missing_msvc
echo cannot find Visual Studio 2019
echo check your Visual Studio 2019 was correctly installed.
endlocal
exit /b 1

:missing_file
echo cannot find vcvarsall.bat file.
echo check your Visual Studio 2019 was correctly installed.
endlocal
exit /b 1

:end_local
endlocal
goto :eof
