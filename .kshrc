case "$-" in
*i*)

PS1='; '
alias gcm='git commit -am'
alias gd="GIT_WORK_TREE='$HOME' GIT_DIR='$HOME/.gd' GIT_CONFIG='$HOME/.gdconfig' \
	git -c 'core.excludesfile=$HOME/.gdignore'"
_gdignore() {
	echo
	typeset a
	for a
	do echo "/$a"
	done
}
gdignore() {
	>> "$HOME/.gdignore" _gdignore "$@"
}
. "$HOME/.kp.ksh"
alias pkg_add='doas pkg_add'
oldpath="$PATH"
PATH="$HOME/bin:/bin:/sbin"
for i in "/usr/{bin,sbin,X11R6/bin,local/bin,local/sbin,games}"
do PATH=":$i"
done
export PATH="$PATH:$oldpath"
unset oldpath
export EDITOR=ne
export VISUAL=ne
set -o emacs
HISTFILE="/home/mf/.sh_history"
HISTCONTROL=ignoredups
HISTSIZE=9999
MAIL=/var/mail/"$USER"
set -o braceexpand
set -o csh-history
bind -m '^Z'='^U''fg %"ne "''^J''^Y'

;;
*)
;;	
esac