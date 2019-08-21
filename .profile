if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi
PATH="$HOME/.linuxbrew/bin:$PATH"
export GOPATH="$HOME/gopath"
export GOROOT="$HOME/.local/go"
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

PATH="$PATH:$HOME/mongodb/mongodb-linux-x86_64-3.2.7/bin"
export PATH

export LANG=pl_PL.utf8
export LC_CTYPE=pl_PL.utf8
export LC_ALL=pl_PL.utf8

if [ "$TERM" == "rxvt-unicode-256color" ]; then
	export TERM="xterm-256color"
fi

#export NNTPSERVER='news.icm.edu.pl'
export NNTPSERVER='nntp.aioe.org'

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
