#!/usr/bin/env bash

if [ -z "${DISPLAY}" ]
then
    echo "Please run this script in a shell that has access to an X session"
    exit 1
fi

mkdir -p ~/Downloads
cd ~/Downloads

# echo 'Ping through wine to initialize the environment as 32bit'
# WINEARCH=win64 WINEPREFIX=~/.wine64 wine ping google.com

echo 'Winetricks for required software'
WINEPREFIX=~/.wine64 winetricks win10
WINEPREFIX=~/.wine64 winetricks dotnet48
WINEPREFIX=~/.wine64 winetricks speechsdk
WINEPREFIX=~/.wine64 winetricks corefonts

# echo 'Download and install aeon'
# curl -O 'https://aeon-timeline-3-release-notes.s3.amazonaws.com/3.2.20/win/AeonTimelineWinInstaller.exe'
# WINEPREFIX=~/.wine64 wine AeonTimelineWinInstaller.exe
