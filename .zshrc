# +-------------+
# + Zsh setting +
# +-------------+

# environment variable
export LANG=ja_JP.UTF-8

# use color
autoload -Uz colors
colors

# set keybind like vi
bindkey -v

# +--- Completion ---+
# enable completion
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# +--- option ---+
# show japanese file name
setopt print_eight_bit
# disable beep
setopt no_beep
# disable flow control
setopt no_flow_control
# comment after '#'
setopt interactive_comments
# auto cd
setopt auto_cd
# auto pushd
setopt auto_pushd
# ignore same directory when pushd
setopt pushd_ignore_dups
# use extended wildcard glob
setopt extended_glob

# +--- History ---+
# set history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# share history
setopt share_history
# ignore same command when add history
setopt hist_ignore_all_dups
# ignore space command when add history
setopt hist_ignore_space
# reduce blanks when add history
setopt hist_reduce_blanks

# +--- Alias ---+
# show files
alias la='ls -a --color'
alias ll='ls -l --color'
# control files
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# move directory
alias cdd='cd /home/yk/Desktop'
alias cdev='cd /home/yk/Documents/Develop'
alias op='xdg-open'
# others
alias killp='pkill -f $1'
alias wall-video='xwinwrap -ni -o 1.0 -fs -s -st -sp -b -nf -- mplayer -wid WID -quiet -loop 0 $1'
alias aud='sudo apt-get update && sudo apt-get -y upgrade'
alias ex='exit'

# enable alias after sudo command
alias sudo='sudo '
# global alias
alias -g L='| less'
alias -g G='| grep'

# +--- zplug ---+
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# theme
zplug 'denysdovhan/spaceship-prompt', use:spaceship.zsh, from:github, as:theme
# history
zplug "zsh-users/zaw"
# typo completion
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# syntax highlight
zplug "zsh-users/zsh-syntax-highlighting"

# install
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# set zaw
if zplug check "zsh-users/zaw"; then
    bindkey '^R' zaw-history
fi
