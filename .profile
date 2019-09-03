test -z "$PROFILEREAD" && . /etc/profile || true

export LANG=pl_PL.UTF-8
export LC_CTYPE=pl_PL.UTF-8
export LC_ALL=pl_PL.UTF-8

export PATH="$HOME/.cargo/bin:$PATH"

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi
export GOPATH="$HOME/.local/gopath"
export GOROOT="$HOME/.local/go"
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

if [ -d "$HOME/.gem/ruby/2.6.0/bin" ]; then
    PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
fi

if [ -d "$HOME/.gem/ruby/2.5.0/bin" ]; then
    PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"
fi

PATH="$HOME/.local/flutter/bin:/opt/dart-sdk/bin:$PATH"

export PATH

export ANDROID_HOME="$HOME/android-sdk"

export PATH="$PATH":"$HOME/.pub-cache/bin"

export LEDGER_FILE="$HOME/pieniadze/hledger.journal"

#export NNTPSERVER='snews://nntp.aioe.org:563'
#export NNTPSERVER='snews://news.eternal-september.org:563'
#export NNTPSERVER='news.icm.edu.pl'
#export NNTPSERVER='nntp.aioe.org'
export NNTPSERVER="news.man.poznan.pl"

. /home/mf/.nix-profile/etc/profile.d/nix.sh
