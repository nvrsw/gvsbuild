@echo off
rem
rem Copyright (c) 2024 EMSTONE, All rights reserved.
rem

setlocal

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
if exist "C:\Program Files\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=C:\Program Files\Microsoft Visual Studio\2019\Community"
if exist "D:\Program Files (x86)\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=D:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
if exist "D:\Program Files\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=D:\Program Files\Microsoft Visual Studio\2019\Community"
if exist "E:\Program Files (x86)\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=E:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
if exist "E:\Program Files\Microsoft Visual Studio\2019\Community" set "MSVC_ROOT=E:\Program Files\Microsoft Visual Studio\2019\Community"

if "%MSVC_ROOT%" == ""  goto missing_msvc
if not exist "%MSVC_ROOT%\VC\Auxiliary\Build\vcvarsall.bat" goto missing_file

if "%1" == "" goto usage

set SourcePath=%1
set Arch=%2

:build

echo "Build GVSBuild"

chcp 437
cd %SourcePath%
call python build.py build lz4 openssl gtk librsvg libssh libuv libcurl libjpeg-turbo json-c -p %Arch% -c release --vs-ver 16

mkdir %SourcePath%\gtk
if "%Arch%" == "x86" (
  call 7z a %SourcePath%\gtk\gtk-win32.7z C:\gtk-build\build\Win32\release\ *
)
else (
  call 7z a %SourcePath%\gtk\gtk-win64.7z C:\gtk-build\build\x64\release\ *
)

echo "Build done"
goto :end_local

:usage
echo Usage:
echo     %0 [source path]
echo Example:
echo     %0 C:\git\gvsbuild
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
