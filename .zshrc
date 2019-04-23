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

# +--- Spaceship prompt ---+
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_CHAR_SYMBOL="ζ*'ヮ')ζ＜ "

# +--- Bind ghq and peco ---+
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# +--- meigen ---+
# lain meigen
date; fortune meigen | cowsay -f lain -n -W


# +--- Plugin ---+
export ZPLUG_HOME=/usr/local/opt/zplug
[ -f "$ZPLUG_HOME/init.zsh" ] || brew install zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-completions"
zplug "supercrabtree/k"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", use:shell/key-bindings.zsh # Ctrl-Rで履歴検索、Ctrl-Tでファイル名検索補完できる
zplug "junegunn/fzf", use:shell/completion.zsh # cd **[TAB], vim **[TAB]などでファイル名を補完できる
zplug "b4b4r07/enhancd", use:init.sh
zplug "momo-lab/zsh-abbrev-alias"
zplug "paulirish/git-open", as:plugin # GitHub, GitLab, BitBucketを開けるようにするコマンド … https://github.com/paulirish/git-open
zplug check || zplug install
zplug load

# +--- Aliases ---+
source ~/.zshalias

# +--- Setting for Hyper and Hyper-tab-icons ---+
# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
precmd() {
   if overridden; then return; fi
   cwd=${$(pwd)##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
