STARTTIMEBASH5="$EPOCHREALTIME"
case "$-" in
    *i* ) ;;
    * ) unset STARTTIMEBASH5; return ;;
esac
if [[ "${BASH_VERSINFO:-0}" -le 4 ]]; then
    >&2 echo "Warning: Staying in Bash $BASH (version $BASH_VERSINFO) < 5."
else
    STARTTIMEBASH5=(${STARTTIMEBASH5: 0 : -7 } ${STARTTIMEBASH5: -6 : 6 })
fi
builtin printf -v INVOKETIMEBASH '%(%s)T' -2

alias s="echo \$?"
alias d="pwd -L"
alias p="pwd -P"
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

alias lsl='ls -l'
alias ll='lsl'
alias lsa='ls -A'
alias l='ls -CF'
alias la='l -A'

alias gcm='git commit -am'

if [ -f ~/config/settings/bash_aliases ]; then
    .  ~/config/settings/bash_aliases
fi

alias _flo_='lftp -p 2024 -u mkf,$(<~/.flopassword) sftp://flounder.online \
    -e '\''mirror -n --delete --exclude=^\.git/$ -P -v '
alias flogetn='_flo_ . ~/flounderl/; bye'\'''
alias flopush='_flo_ -R ~/flounderl/ .; bye'\'''
