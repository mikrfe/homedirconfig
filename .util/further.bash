FURTHER_BASH=$(type -p bash)
if [[ $SHELL != $BASH ]]
then
    unset FURTHER_BASH
    >&2 echo "Now it's Bash $BASH (version $BASH_VERSINFO)."
elif [[ $BASH != $FURTHER_BASH ]]
then
    >&2 echo "Swapping Bash $BASH (version $BASH_VERSINFO) for $FURTHER_BASH …"
    exec $FURTHER_BASH "$@"  # exec might be a bad idea
else
    unset FURTHER_BASH
    >&2 echo "Login shell already Bash $BASH (version $BASH_VERSINFO)."
fi
[ "${BASH_VERSINFO:-0}" -le 4 ] && {
    >&2 echo "Warning: Staying in Bash $BASH (version $BASH_VERSINFO) < 5."
    (exit 2)
}
