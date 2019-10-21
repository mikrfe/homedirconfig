shopt -s histappend
history -a
shopt -s checkwinsize
[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
alias gd='GIT_WORK_TREE="$HOME" GIT_DIR="$HOME/.gd" git'
# You might want to have e.g. tty in prompt (e.g. more virtual machines)
# and console windows
# If you want to do so, just add e.g.
# if [ "$PS1" ]; then
#   PS1="[\u@\h:\l \W]\\$ "
# fi
# to your custom modification shell script in /etc/profile.d/ directory

# if ! shopt -q login_shell ; then # We're not a login shell
#   # Need to redefine pathmunge, it gets undefined at the end of /etc/profile
#   pathmunge () {
#       case ":${PATH}:" in
#           *:"$1":*)
#               ;;
#           *)
#               if [ "$2" = "after" ] ; then
#                   PATH=$PATH:$1
#               else
#                   PATH=$1:$PATH
#               fi
#       esac
#   }

#   # By default, we want umask to get set. This sets it for non-login shell.
#   # Current threshold for system reserved uid/gids is 200
#   # You could check uidgid reservation validity in
#   # /usr/share/doc/setup-*/uidgid file
#   if [ $UID -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
#      umask 002
#   else
#      umask 022
#   fi

#   SHELL=/bin/bash
#   # Only display echos from profile.d scripts if we are no login shell
#   # and interactive - otherwise just process them to set envvars
#   for i in /etc/profile.d/*.sh; do
#       if [ -r "$i" ]; then
#           if [ "$PS1" ]; then
#               . "$i"
#           else
#               . "$i" >/dev/null
#           fi
#       fi
#   done

#   unset i
#   unset -f pathmunge
# fi

# vim:ts=4:sw=4
