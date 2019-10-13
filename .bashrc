[[ $- != *i* ]] && return
alias s="echo \$?"
alias d="pwd -L"
alias p="pwd -P"
alias gd='GIT_WORK_TREE="$HOME" GIT_DIR="$HOME/.gd" git'
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=50000
HISTFILESIZE=5000000
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s globstar # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
shopt -s extglob

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
debian_chroot_ps1_prefix="${debian_chroot:+($debian_chroot)}"

declare -A oCoRe=(
	[RCol]='\[\e[0m\]'
	[Red]='\[\e[0;31m\]'
	[Gre]='\[\e[0;32m\]'
	[BYel]='\[\e[1;33m\]'
	[BBlu]='\[\e[1;34m\]'
	[Pur]='\[\e[0;35m\]'
)
case "$TERM" in
    *color ) ;;
    * ) unset oCoRe ;;
esac

debian_chroot_ps1_prefix_temp="${debian_chroot_ps1_prefix:+$oCoRe[RCol]$debian_chroot_ps1_prefix}"
PS1_TEMPLATE="${oCoRe[Red]}\h:${oCoRe[BBlu]}\w${oCoRe[Pur]}¶ ${oCoRe[RCol]}"
PROMPT_DIRTRIM=3
PROMPT_COMMAND=__prompt_command
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
export EDITOR='kak'

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
