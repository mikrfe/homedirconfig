# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=5000
export HISTFILESIZE=5000000

alias s="echo \$?"
alias d="pwd -L"
alias p="pwd -P"
alias ls='ls --color=auto'
PS1='• \h § \W ¶ '

alias gd='GIT_WORK_TREE="$HOME" GIT_DIR="$HOME/.gd" git'

source ~/.bash_prompt.sh

alias gcm='git commit -am'

alias folgat='"$GOPATH/src/github.com/ArchieT/twitfol/folgat.sh"'

export GIT_PAGER="less -r"

#export EDITOR='nvim'

#alias vi='nvim'
#alias nvi="nvim"
#export EDITOR='vim'
export EDITOR='kak'

alias vi='vim'
alias gvi='gvim'

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#source ~/.promptline.sh

# added by travis gem
#[ -f /home/mf/.travis/travis.sh ] && source /home/mf/.travis/travis.sh

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/mf/.netlify/helper/path.bash.inc' ]; then source '/home/mf/.netlify/helper/path.bash.inc'; fi
