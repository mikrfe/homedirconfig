FURTHER_BASH=$(type -p bash)
if [[ $SHELL != $BASH ]]
then
    unset FURTHER_BASH
elif [[ $BASH != $FURTHER_BASH ]]
then 
    $FURTHER_BASH
    exit $?
else
    unset FURTHER_BASH
    >&2 echo "Staying in login shell."
fi
[ "${BASH_VERSINFO:-0}" -le 4 ] && {
    >&2 echo "Warning: Staying in bash version $BASH_VERSINFO < 5."
    (exit 2)
}
