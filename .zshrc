# +-------------+
# + Zsh setting +
# +-------------+


# use color
autoload -Uz colors
colors

# set keybind like emacs
bindkey -e

# +--- Completion ---+
# enable completion
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# +--- Option ---+
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
# not use extended wildcard glob
setopt nonomatch

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

# +--- Aliases ---+
source ~/.zshalias

# +--- Spaceship prompt ---+
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
