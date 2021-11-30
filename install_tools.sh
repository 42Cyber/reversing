#!/bin/bash
set -e
git clone https://github.com/42Cyber/reversing.git $HOME/reversing || true
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
code $HOME/reversing
brew --version || rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
. ~/.zshrc
docker --version || brew install docker && brew install --Cask Docker
docker info 2>/dev/null || open -g -a Docker
MOUNTPOINT="/Volumes/MountPoint"
IFS="
"

if [ ! -f bn.dmg ]; then
    # download bn.dmg
    curl https://cdn.binary.ninja/installers/BinaryNinja-demo.dmg -o bn.dmg 
fi

hdiutil attach -mountpoint $MOUNTPOINT bn.dmg

for app in `find $MOUNTPOINT -type d -maxdepth 2 -name \*.app `; do
    if [ -d /sgoinfre/students/$USER/binary_ninja/ ]; then
        continue
    fi
    mkdir -p /sgoinfre/students/$USER/binary_ninja/
    echo "installing $(basename $app)"
    cp -a $MOUNTPOINT/*.app /sgoinfre/students/$USER/binary_ninja/Binary_ninja.app
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/sgoinfre/students/'${USER}/binary_ninja/Binary_ninja.app'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    open /sgoinfre/students/${USER}/binary_ninja/Binary_ninja.app
done
killall Dock
open /sgoinfre/students/$USER/binary_ninja/
hdiutil detach $MOUNTPOINT || true
rm bn.dmg
echo "FINISHED!!"
