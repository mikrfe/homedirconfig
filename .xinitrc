PICKED_SESSION="$1"
[ -z "$PICKED_SESSION" ] && PICKED_SESSION="cwm"
export PICKED_SESSION
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
exec $PICKED_SESSION
