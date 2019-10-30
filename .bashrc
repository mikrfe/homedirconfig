# ~/.bashrc
STARTTIMEBASH5="$EPOCHREALTIME"
< /proc/uptime builtin read START_PROC_UPTIME
case "$-" in
    *i* ) ;;
    * ) unset START_PROC_UPTIME; unset STARTTIMEBASH5; return ;;
esac
if [[ "${BASH_VERSINFO:-0}" -ge 5 ]]; then
	STARTTIMEBASH5=(${STARTTIMEBASH5: 0 : -7 } ${STARTTIMEBASH5: -6 : 6 })
fi
START_PROC_UPTIME=($START_PROC_UPTIME)
builtin printf -v INVOKETIMEBASH '%(%s)T' -2

< /proc/self/stat builtin read START_PROC_SELF_STAT # no -a because [1] is () delimited and may contain space
# 1 ([0]) — PID; 22 ([23]) — starttime (jiffies)
PROC_SELF_STAT_STARTTIME="${START_PROC_SELF_STAT##*\)}"
PROC_SELF_STAT_STARTTIME=($PROC_SELF_STAT_STARTTIME)
PROC_SELF_STAT_STARTTIME="${PROC_SELF_STAT_STARTTIME[19]}"

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

alias s="echo \$?"
alias d="pwd -L"
alias p="pwd -P"
PS1='• \h § \W ¶ '

alias gd='GIT_WORK_TREE="$HOME" GIT_DIR="$HOME/.gd" git'

alias gcm='git commit -S -am'

alias nvi="nvim"

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
PROMPT_COMMAND='history -a; __prompt_command'
__prompt_command() {
	case "$?" in
		0 ) PS1="${oCoRe[Gre]}•" ;;
		* ) PS1="${oCoRe[BYel]}¬" ;;
	esac
	PS1+="${PS1_TEMPLATE}"
}

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    LS_OPTIONS="--color=auto"
    GREP_OPTIONS="--color=auto"
    alias ls="ls $LS_OPTIONS"
fi

export GIT_PAGER='less -R'
# export EDITOR='kak'

alias lsl='ls -l'
alias ll='lsl'
alias lsa='ls -A'
alias l='ls -CF'
alias la='l -A'

alias gcm='git commit -am'
alias gcn='git commit -a'
alias gca='git commit -a'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
