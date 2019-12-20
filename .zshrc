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

# +--- Meigen ---+
# lain meigen
date; fortune meigen | cowsay -f lain -n -W
# cat <<EOF | cowsay -f lain -n -W
# 鳥を見た人世の爪の跡、虫の書いた嘘が溢れる、
# それは両方の刃に挟まれて、鉄を手繰り寄せ、
# 四月は過ぎて行く、
# 
# 飛来する幽霊と笛の音、虚ろな遺灰の中を探る、
# それは安心の輪に満たされて、虹色の居間で、
# 
# 二月の様に空をなぞって、火が着く様に雲を塞ぎ込んでいく、
# 
# 土に滲む海の水が蛇の針を逆立てて、息を呑んだ異形は騒々しく池に飛び込んだ、
# 
# 線の国で狐が宛てる手紙、壁画の裏で消える、眼を隠しても見える酷く優雅で煩瑣な世界、
# そこでずっと暮らしていくと右手外し片目で探る未来、きっとそれは永遠に続く人間に良く似た外の夢
# 
# 被害者は寝殿の蚊帳の外、星の無い夕が忙しく鳴る、
# 水は表情だけを認める、霞むような色で今日が限りなく透明な風になる、
# 
# 意図の無い様な手のシグナル、それは平等すらも絆される、
# 何時も騒ぐだけで火が付く道理、絹を纏って、見え透いた情に縋る瞳、
# 
# 飛んで行く先に沈む羽の欠片、聡明な怪の山、近くにある一人の闇に膝を合わせて泣いた、
# 
# 我楽多を産んだ、湿る鯖は法律を何度も破っている、
# 消えてしまう前に溶け出したあの光を見出して、
# 
# 「線の声が聞こえた！」照らす陰にただ願った、
# 偶然に汲んだ首飾りでも、変わらないその日々が届くまで、
# 
# 「ここでずっと暮らしていくよ」祈る叫びは木霊する瞬間に、
# きっとそれは永遠に続く、人間によく似た外の夢を見た外に似た人の夢
# 
# もし次の人生を選ぶなら、指示の無い方へと手を翳す、
# それは表情からも読み取れる、君にとって僕は何の舵になる？
# 
# 心外な胸の音、意味が無い様で嬉しくなる、
# 花を擁する声で振り返る、いつも側にある人外達の夢
# EOF

# +--- Plugin ---+
export ZPLUG_HOME=/usr/local/opt/zplug
[ -f "$ZPLUG_HOME/init.zsh" ] || brew install zplug
source $ZPLUG_HOME/init.zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
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

# +--- Spaceship prompt ---+
SPACESHIP_CHAR_SYMBOL="ζ*'ヮ')ζ＜ "

# +--- Aliases ---+
source ~/.zshalias

# +--- Sub command ---+
# worktree移動
function cdworktree() {
    # カレントディレクトリがGitリポジトリ上かどうか
    git rev-parse &>/dev/null
    if [ $? -ne 0 ]; then
        echo fatal: Not a git repository.
        return
    fi

    local selectedWorkTreeDir=`git worktree list | fzf | awk '{print $1}'`

    if [ "$selectedWorkTreeDir" = "" ]; then
        # Ctrl-C.
        return
    fi

    cd ${selectedWorkTreeDir}
}

# +--- Env init ---+
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

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

cat $HOME/workspace/dotfiles/terminal_shortcut

prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new -t `printf %q "$PREV"`"
}

