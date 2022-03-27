# Fig(https://github.com/withfig/fig) pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"

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
cdpath=(.. ~ ~/workspace)
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

# +--- Custom shortcut key bindings ---+
: "key binding" && {
  bindkey -e # emacs キーマップを選択
  : "Ctrl-Yで上のディレクトリに移動できる" && {
    function cd-up { zle push-line && LBUFFER='builtin cd ..' && zle accept-line }
    zle -N cd-up
    bindkey "^Y" cd-up
  }
  : "Ctrl-Wでパスの文字列などをスラッシュ単位でdeleteできる" && {
    autoload -U select-word-style
    select-word-style bash
  }
  : "Ctrl-[で直前コマンドの単語を挿入できる" && {
    autoload -Uz smart-insert-last-word
    zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*' # [a-zA-Z],/, \ のうち少なくとも1文字を含む長さ2以上の単語
    zle -N insert-last-word smart-insert-last-word
    bindkey '^[' insert-last-word
    # see http://qiita.com/mollifier/items/1a9126b2200bcbaf515f
  }
}

# +--- Plugin ---+
export ZPLUG_HOME=/usr/local/opt/zplug
[ -f "$ZPLUG_HOME/init.zsh" ] || brew install zplug
source $ZPLUG_HOME/init.zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-completions"
zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && sudo make install"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", use:shell/key-bindings.zsh # Ctrl-Rで履歴検索、Ctrl-Tでファイル名検索補完できる
zplug "junegunn/fzf", use:shell/completion.zsh # cd **[TAB], vim **[TAB]などでファイル名を補完できる
zplug "b4b4r07/enhancd", use:init.sh
zplug "mogimogitomato/git-br", as:command, use:'git-br'
zplug "momo-lab/zsh-abbrev-alias"
zplug "paulirish/git-open", as:plugin # GitHub, GitLab, BitBucketを開けるようにするコマンド … https://github.com/paulirish/git-open
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug check || zplug install
zplug load

# +--- Aliases ---+
source ~/.zshalias

# +--- Sub command ---+
# 直前に実行したコマンドをpetに追加する
pet-prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new -t `printf %q "$PREV"`"
}
# Bind ghq and peco (https://qiita.com/strsk/items/9151cef7e68f0746820d)
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

# +--- Spaceship prompt ---+
SPACESHIP_CHAR_SYMBOL="ζ*'ヮ')ζ＜ "

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

# +--- Env init ---+
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Fig(https://github.com/withfig/fig) post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"
