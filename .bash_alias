# Aliases for Git bash

# 文字化け対策
function wincmd()
{
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}
case "$TERM" in
xterm*)
    # Windowsのコマンドを追加
    # 出力をSJIS(CP932)からUTF-8に変換できる
    # MSYS2のコマンドはUTF-8しか受け付けない(less, grep, etc...)
    for name in ipconfig ping route
    do
        case "$(type -p "$name".exe 2>/dev/null)" in
        ''|/usr/bin/*) continue;;
        esac
        alias $name="wincmd $name.exe"
    done
    ;;
esac

# 設定の読み込み
#alias reload='source ~/.bashrc'
alias relogin='exec $SHELL -l'
alias reset='echo -ne "\033c"'
alias rr='reset;relogin'
alias re='rr'

# 移動しやすく
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias cdd='cd ~/Desktop'
alias cdev='cd /c/workspace/'

# lsを使いやすく
alias dir='dir --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# ディスクサイズ
alias df='df -Th'
alias du='du -h'
alias du1='du -d1'

# grepを使いやすく
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# customize aliases
alias op='start'
alias g='git'

# for ghq(look時の起動シェルをbashに指定する)
# SHELL="/usr/bin/bash"
# alias ghq='COMSPEC="${SHELL}" ghq'

# adb logcatコマンド
alias adblog='adb logcat | logcatf --color'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $?=0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# IPアドレスを簡単に
alias ifconfig='ipconfig'
alias ip='ipconfig | grep --text IPv4'
alias r4='route print -4;echo "ROUTE ADD is \"route -p add [dst] msk 255.255.255.0 [gw]\""'

# pingのコマンド名混同を避けるため絶対パスで指定
alias ping='/c/windows/system32/ping'
# ネットワーク確認用
alias ping1='ping www.google.com'
alias ping2='ping 192.168.0.1'

# 圧縮解凍
# tar.gz
alias targz='tar -xcvf'
alias untar='tar -zxvf'