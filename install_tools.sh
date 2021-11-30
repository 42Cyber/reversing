#!/bin/bash

brew --version || rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
docker --version || brew install docker
docker info || open -g -a Docker
MOUNTPOINT="/Volumes/MountPoint"
IFS="
"
# if bn.dmg doesnt exist
if [ ! -f bn.dmg ]; then
    # download bn.dmg
    curl https://cdn.binary.ninja/installers/BinaryNinja-demo.dmg -o bn.dmg 
fi

hdiutil attach -mountpoint $MOUNTPOINT bn.dmg

for app in `find $MOUNTPOINT -type d -maxdepth 2 -name \*.app `; do
    mkdir -p /sgoinfre/students/$USER/binary_ninja/
    echo "installing $(basename $app)"
    cp -a $MOUNTPOINT/*.app /sgoinfre/students/$USER/binary_ninja/Binary_ninja.app
    read -s -n 1 -p "Press any key to continue . . ."
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/sgoinfre/students/'${USER}/binary_ninja/Binary_ninja.app'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    open /sgoinfre/students/${USER}/binary_ninja/Binary_ninja.app
done
killall Dock
open /sgoinfre/students/$USER/binary_ninja/
hdiutil detach $MOUNTPOINT
rm bn.dmg

