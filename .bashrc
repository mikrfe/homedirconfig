# ~/.bashrc
STARTTIMEBASH5="$EPOCHREALTIME"
< /proc/uptime builtin read START_PROC_UPTIME
case "$-" in
    *i* ) ;;
    * ) unset START_PROC_UPTIME; unset STARTTIMEBASH5; return ;;
esac
if [[ "${BASH_VERSINFO:-0}" -le 4 ]]; then
    >&2 echo "Warning: Staying in Bash $BASH (version $BASH_VERSINFO) < 5."
else
    STARTTIMEBASH5=(${STARTTIMEBASH5: 0 : -7 } ${STARTTIMEBASH5: -6 : 6 })
fi
START_PROC_UPTIME=($START_PROC_UPTIME)
builtin printf -v INVOKETIMEBASH '%(%s)T' -2

< /proc/self/stat builtin read START_PROC_SELF_STAT # no -a because [1] is () delimited and may contain space
# 1 ([0]) — PID; 22 ([23]) — starttime (jiffies)
PROC_SELF_STAT_STARTTIME="${START_PROC_SELF_STAT##*\)}"
PROC_SELF_STAT_STARTTIME=($PROC_SELF_STAT_STARTTIME)
PROC_SELF_STAT_STARTTIME="${PROC_SELF_STAT_STARTTIME[19]}"

alias s="echo \$?"
alias d="pwd -L"
alias p="pwd -P"
alias gd='GIT_WORK_TREE="$HOME" GIT_DIR="$HOME/.gd" GIT_CONFIG="$HOME/.gdconfig" git'
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=50000
HISTFILESIZE=5000000
HISTTIMEFORMAT='%t%F %T%t'
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s globstar # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
shopt -s extglob

# make history work for you
shopt -s histverify histreedit

source "$HOME/.util/bindings.bash"

declare -A oCoRe=(
        [RCol]='\[\e[0m\]'
        [Red]='\[\e[0;31m\]'
        [Gre]='\[\e[0;32m\]'
        [BYel]='\[\e[1;33m\]'
        [BBlu]='\[\e[1;34m\]'
        [Pur]='\[\e[0;35m\]'
)
case "$TERM" in
    xterm | *color ) ;;
    * ) unset oCoRe ;;
esac

PS1_TEMPLATE="${oCoRe[Red]}\h:${oCoRe[BBlu]}\w${oCoRe[Pur]}¶ ${oCoRe[RCol]}"
PROMPT_DIRTRIM=3
PROMPT_COMMAND=__prompt_command
__prompt_command() {
        case "$?" in
                0 ) PS1="${oCoRe[Gre]}•" ;;
                * ) PS1="${oCoRe[BYel]}¬" ;;
        esac
        history -a
        PS1+="${PS1_TEMPLATE}"
}

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    LS_OPTIONS="--color=auto"
    GREP_OPTIONS="--color=auto"
    alias ls="ls $LS_OPTIONS"
fi

export GIT_PAGER='less -R'
export EDITOR='kak'

alias lsl='ls -l'
alias ll='lsl'
alias lsa='ls -A'
alias l='ls -CF'
alias la='l -A'

alias gcm='git commit -am'

alias vi='vim'
alias gvi='gvim'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

eval "$(direnv hook bash)"
