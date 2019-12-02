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
eval `brew cask list | grep \"font-fira-code\"`
if [ $? = 1 ]; then
  echo "\nfont-fira-code isn't install yet. start installing...\n\n"
  eval `brew tap homebrew/cask-fonts && brew cask install font-fira-code`
else
  echo "font-fira-code already installed."
fi
##  solargraph(依存パッケージとしてrubocopもinstallされる)
eval `gem list | grep \"solargraph\"`
if [ $? = 1 ]; then
  echo "\nsolargraph isn't install yet. start installing...\n\n"
  eval `sudo gem install solargraph`
else
  echo "solargraph already installed."
fi

cat ./extensions | while read line
do
  code --install-extension $line
done

code --list-extensions > extensions
