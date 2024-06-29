# dotfiles

- loading dotfile under the root folder
.gitconfig  
.hyper.js  
.vimrc  
.zshalias  
.zshenv  
.zshrc  
→ `sh make_symlink.sh`  
other dotfiles  
→ please set manually  

- add cowsay's image, and fortune's japanese text(for Mac)  
→ `sh fortune_cowsay.sh`  

# zsh

- zplug
`curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh`

- starship
`curl -sS https://starship.rs/install.sh | sh`

# brewfile

`cd .brewfile && brew bundle`

# vim

in terminal  

```sh
please read 'https://github.com/Shougo/dein-installer.vim' and install dein
```

Make .vimrc's symlink to replace dein's default .vimrc
then open vim, and execute `call dein#install()`  

 # pip

`pip install -r pip/requirements.txt`

confirm list packages that are not dependencies of installed packages
`pip list --not-required`
