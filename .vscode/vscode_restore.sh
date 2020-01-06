#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

# redefine settings
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# check package's install state
##  font-fira-code
if brew cask ls --versions font-fira-code > /dev/null; then
  echo "font-fira-code already installed.\n"
else
  echo "font-fira-code isn't install yet. start installing...\n\n"
  eval `brew tap homebrew/cask-fonts && brew cask install font-fira-code`
fi
##  solargraph(依存パッケージとしてrubocopもinstallされる)
result=`gem list -i solargraph`
if [ $result = 'true' ]; then
  echo "snnolargraph already installed.\n"
else
  echo "solargraph isn't install yet. start installing...\n\n"
  sudo gem install solargraph
fi

cat ./extensions | while read line
do
  code --install-extension $line
done

code --list-extensions > extensions
