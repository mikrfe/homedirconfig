if [[ "${BASH_VERSINFO:-0}" -le 4 ]]; then
    >&2 echo "Warning: Staying in Bash $BASH (version $BASH_VERSINFO) < 5."
fi
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

alias gcm='git commit -am'

if [ -f ~/config/settings/bash_aliases ]; then
    .  ~/config/settings/bash_aliases
fi
