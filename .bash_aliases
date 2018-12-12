# Aliases for Git bash

# ���������΍�
function wincmd()
{
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}
case "$TERM" in
xterm*)
    # Windows�̃R�}���h��ǉ�
    # �o�͂�SJIS(CP932)����UTF-8�ɕϊ��ł���
    # MSYS2�̃R�}���h��UTF-8�����󂯕t���Ȃ�(less, grep, etc...)
    for name in ipconfig ping route
    do
        case "$(type -p "$name".exe 2>/dev/null)" in
        ''|/usr/bin/*) continue;;
        esac
        alias $name="wincmd $name.exe"
    done
    ;;
esac

# �ݒ�̓ǂݍ���
#alias reload='source ~/.bashrc'
alias relogin='exec $SHELL -l'
alias reset='echo -ne "\033c"'
alias rr='reset;relogin'
alias re='rr'

# �ړ����₷��
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias cdd='cd ~/Desktop'
alias cdev='cd /c/workspace/'

# ls���g���₷��
alias dir='dir --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# �f�B�X�N�T�C�Y
alias df='df -Th'
alias du='du -h'
alias du1='du -d1'

# grep���g���₷��
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# customize aliases
alias op='start'
alias g='git'

# for ghq(look���̋N���V�F����bash�Ɏw�肷��)
# SHELL="/usr/bin/bash"
# alias ghq='COMSPEC="${SHELL}" ghq'

# adb logcat�R�}���h
alias adblog='adb logcat | logcatf --color'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $?=0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# IP�A�h���X���ȒP��
alias ifconfig='ipconfig'
alias ip='ipconfig | grep --text IPv4'
alias r4='route print -4;echo "ROUTE ADD is \"route -p add [dst] msk 255.255.255.0 [gw]\""'

# ping�̃R�}���h������������邽�ߐ�΃p�X�Ŏw��
alias ping='/c/windows/system32/ping'
# �l�b�g���[�N�m�F�p
alias ping1='ping www.google.com'
alias ping2='ping 192.168.0.1'

# ���k��
# tar.gz
alias targz='tar -xcvf'
alias untar='tar -zxvf'