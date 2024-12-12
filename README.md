## Goals

This python script helps you build a full GTK+ library stack for Windows using Visual Studio.

The powershell script was originally [developed by the HexChat developers](https://github.com/hexchat/gtk-win32), make sure to check their page for more information about the original script.

HexChat developers decided that their script should focus on their specific needs, this fork tries to be a bit more generic, in particular it pursues the following goals

1. Build GTK+ 3 - we want to focus on the current version of GTK
1. Support multiple version of Visual Studio - at the moment we are focusing on VS 2017, but we include projects for other versions and we gladly accept patches
1. We try to follow as much as possible the conventions of the upstream MSVC projects by Fan Chun-wei - [Compiling the GTK+ (and Clutter) stack using Visual C++ 2008 and later](https://wiki.gnome.org/action/show/Projects/GTK+/Win32/MSVCCompilationOfGTKStack).
1. We are pretty liberal about adding more libraries to the script - at some point we will need to make the set of libraries that are built configurable and easily extensible, but right now we are ok with adding libraries that are useful to the users of this script
1. We try to fetch tarballs from their original locations - if patches are needed we try to fork the project on github and host a patched tarball there 
1. We check sha256 hashes of the downloaded files: if error arise check that the download is not been interrupted: a partial file is likely to miss the hash check. Delete the file and try again. 
1. The download is done using the ssl certificate (handled by the system), in case of error the download is tried again without the certificate. 
1. We try to download also the tools needed and using them from a local directory, without any installation. Actually we use directly, among others, cmake, meson, ninja, nuget and perl.

## Building

1. Install the following build tools and dependencies:

    * [Visual Studio for Windows Desktop](http://www.visualstudio.com/downloads) - 2013, 2015 and 2017 are currently supported.
    * [msys2](https://msys2.github.io/)
    * [Python 3.13](https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe)

1. Environment PATH System Variables
    * C:\Python37

1. Follow the instructions on the msys2 page to update the core packages. The needed packages for the script (make, diffutils, ...) are download and installed automatically if not presents in the msys2 installation.

1. Clone [this repository](https://github.com/wingtk/gvsbuild) to _C:\gtk-build\github\gvsbuild_ It contains the build script, project files and patches.

1. Now start a command-line window as a regular user. Go to the _gvsbuild_ directory and start building with the script. For example, to build 32-bit GTK+ 3 and its dependencies, run:

    ```sh
    cd C:\gtk-build\github\gvsbuild
    python .\build.py build gtk3
    ```

    To build the 64-bit version, run:

    ```sh
    cd C:\gtk-build\github\gvsbuild
    python .\build.py build -p x64 gtk3
    ```

    For more information about the possible commands. Run

    ```sh
    python .\build.py --help
    ```

    Is possible to set some parameters from a file, e.g. vs2015-release.pro, putting the @ character before the file name. The file contains the option, one per line, separated by a carriage return:
    
    ```
    --vs-ver
    15
    --win-sdk
    8.1
    -c
    release
    ```

    Even if the format is not the easier to write or read in this way we eliminate the problem of escaping spaces is file names and directories. Then you can use it:

    ```sh
    python .\build.py build @vs2015-release.pro gtk3-full
    ```
1. To build CMS

    ```sh
    python build.py build lz4 openssl gtk librsvg libssh libuv libcurl libjpeg-turbo json-c -p x86 -c release --vs-ver 16
    python build.py build lz4 openssl gtk librsvg libssh libuv libcurl libjpeg-turbo json-c -p x64 -c release --vs-ver 16
    ```

1. To build Kakudai Window Manager

    ```sh
    python build.py build clutter gtk3 json-c leveldb libcurl libjpeg-turbo libmicrohttpd librsvg libssh libuv libzip lz4 openssl protobuf-c -c release -p x86 --vs-ver 16
    python build.py build clutter gtk3 json-c leveldb libcurl libjpeg-turbo libmicrohttpd librsvg libssh libuv libzip lz4 openssl protobuf-c -c release -p x64 --vs-ver 16
    ```

1. When the script is done, your GTK+ stack will be found under _C:\gtk-build\gtk_. Enjoy!

## License

This build script is licensed under the GPL2.0 license, see the COPYING file for the full text.

The binaries produced by the build script are licensed under the license terms of the project that gets built (ie glib is LGPL so you can use glib.dll built with this script under the terms of LGPL).

Patches included in the repository are licensed under the license terms of the project they apply to.

## Dependency print / graph

To see and analyze the dependency between the various projects, in text or in a Graphviz format, use the script deps.py:

    ```sh
    cd C:\gtk-build\github\gvsbuild
    python .\deps.py -g -o test.gv
    ```

Without option a simple dependency of all the projects is printed, as usual with --help a summary of the options/commands is printed. 

