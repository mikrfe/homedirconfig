[ -f /tmp/_kp_help ] && keepassxc-cli --help-all |
sed -En '/^add /,${/^[O ]/,$d;s/^([^ ]*) .*/\1/p;}' > /tmp/_kp_help
kp() {
	[[ "x$_KEPDB" == x ]] && { >&2 echo "no lowsecrets _KEPDB"; return 1; }
	typeset kpo
	set -A kpo
	[[ "x$_KEPDBK" != x ]] && set -A kpo -- -k "$_KEPDBK"
	typeset _kpo="${#kpo[@]}"

	typeset kpcmd
	if [ $# -eq 0 ]; then kpcmd=open
	elif echo "$1" | fgrep -qxf /tmp/_kp_help
	then kpcmd="$1"; shift
	else kpcmd=show
	fi
	# shifted one if command known

	while [[ '--' != "$1" ]] && [[ "-" == "${1%%[!-]*}" ]]
	do kpo[${#kpo[*]}]="$1"
	shift
	done
	# shifted and kpo'd while not -- but starting with -

	typeset a
	if [[ '--' == "$1" ]] then shift
	# if we stopped at -- then go past it
	# if it was not -- but end of starting with dash
	elif [ ${#kpo[@]} -ne ${_kpo} ] && [ $# -ne 0 ]
	then	while [ $# -ne 0 ] && [[ '--' != "$1" ]]
		do	kpo[${#kpo[*]}]="$1"
			shift
		done
		# kpo'd and shifted while still any and we're not at a --
		if [ $# -eq 0 ] #no more left, no -- found
		then	>&2 echo "option placement ambiguity, use '--' please."
			return 1
		else shift
		fi
	fi
	case "$kpcmd" in
	diceware|estimate|generate|help)
		unset kpo[0] kpo[1]
		keepassxc-cli $kpcmd "${kpo[@]}" "$@"
		;;
	import)
		typeset xml="$1"
		shift
		keepassxc-cli import "${kpo[@]}" -- $xml "$_KEPDB" "$@"
		;;
	*)
		keepassxc-cli "$kpcmd" "${kpo[@]}" -- "$_KEPDB" "$@"
		;;
	esac
}