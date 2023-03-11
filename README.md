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
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

then open vim, and execute `call dein#install()`  

 # pip

`pip install -r pip/requirements.txt`


