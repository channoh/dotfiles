###############
#
# Basic Configs
#
###############

export TERM=xterm-256color
#export TERM=tmux-256color
export SHELL=/bin/bash
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export PATH=$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=$HOME/.dotfiles/scripts:$PATH
export LIBRARY_PATH=$HOME/.local/lib
export LD_LIBRARY_PATH=$HOME/.local/lib
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH
export CPATH=$HOME/.local/include

# export DISPLAY=:0
LS_COLORS='ow=01;36;40'
export LS_COLORS

unset GREP_OPTIONS
alias grep="grep --color=auto --exclude=tags"
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'

parse_git_info() {
    commit=`git rev-parse --short HEAD 2> /dev/null`
    branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [[ x"$commit" != "x" ]]; then
      echo " ($branch, $commit)"
    fi
}

PS_COLOR='\033[01;32m'
GIT_COLOR='\033[00;33m'
PS1="\["$PS_COLOR"\]\u@\h:\w"$GIT_COLOR"\$(parse_git_info)\[\033[00m\] - \D{%H:%M:%S}\n\$ "

## Auto complete
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


###############
#
# Tmux
#
###############

if [ -n "${TMUX}" ]; then
    ## bind keys
    bind '"\e\e[D" backward-word'
    bind '"\e\e[C" forward-word'
fi

##################
#
# Custom functions
#
##################

function extract() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar e $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *.tar.xz)   tar xfJ $1      ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}

function compress() {
    if [[ -e $2 ]]; then
        case $1 in
            *.tar.bz2)  tar -jcvf $1 $2 ;;
            *.tar.gz)   tar -zcvf $1 $2 ;;
            *.zip)      zip -r $1 $2        ;;
            *)          echo "'$2' cannot be compressed via compress()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}

function dirdiff() {
    if [ "$#" -eq 1  ]; then
        vim -c "DirDiff . $1"
    elif [ "$#" -eq 2 ]; then
        vim -c "DirDiff $1 $2"
    else
        echo "usage example: dirdiff <dir1> <dir2>"
    fi
}

function trimall() {
    find . -name "*" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'
}

function work() {
    echo -ne '\033]0;'$HOSTNAME'\a'
    tmux new-session -A -s dev
}

function hex2ascii() {
    for n in $@; do
        python3 -c "print(bytes.fromhex(str('$n')).decode('ASCII'))"
    done
}
