# ~/.bashrc

# [[ $SHELL == "/bin/bash" ]] &&   # has no effect
[ "${BASH_VERSINFO:-0}" -le 4 ] && (return $NO_FURTHER_PLEASE) && { NO_FURTHER_PLEASE=1 bash; return }

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=5000
export HISTFILESIZE=5000000

#alias gpg='gpg2'

alias s="echo \$?"
alias d="pwd -L"
alias p="pwd -P"
alias ls='ls --color=auto'
PS1='• \h § \W ¶ '

alias gd='GIT_WORK_TREE="$HOME" GIT_DIR="$HOME/.gd" git'

source ~/.bash_prompt.sh

alias gcm='git commit -S -am'

export EDITOR='nvim'

alias vi='nvim'
alias nvi="nvim"

# . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#source ~/.promptline.sh

# added by travis gem
#[ -f /home/mf/.travis/travis.sh ] && source /home/mf/.travis/travis.sh
