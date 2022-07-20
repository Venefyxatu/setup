#!/usr/bin/env bash

if [ -z "${DISPLAY}" ]
then
    echo "Please run this script in a shell that has access to an X session"
    exit 1
fi

mkdir -p ~/Downloads
cd ~/Downloads

echo 'Ping through wine to initialize the environment as 32bit'
WINEARCH=win32 WINEPREFIX=~/.wine wine ping google.com

echo 'Winetricks for required software'
winetricks win10
winetricks dotnet48
winetricks speechsdk
winetricks corefonts

echo 'Download and install scrivener'
curl -O 'https://scrivener.s3.amazonaws.com/Scrivener-installer-x86.exe'
wine Scrivener-installer-x86.exe
