[ -f /tmp/_kp_help ] && keepassxc-cli --help-all |
sed -En '/^add /,${/^[O ]/,$d;s/^([^ ]*) .*/\1/p;}' > /tmp/_kp_help
kp() {
	[[ "x$_KEPDB" == x ]] && { >&2 echo "no lowsecrets _KEPDB"; return 1; }
	typeset kpo
	set -A kpo
	[[ "x$_KEPDBK" != x ]] && set -A kpo -- -k "$_KEPDBK"
	typeset kpcmd
	if [ $# -eq 0 ]; then kpcmd=open
	elif echo "$1" | fgrep -qxf /tmp/_kp_help
	then kpcmd="$1"; shift
	else kpcmd=show
	fi
	[[ '--' == "$1" ]] ||
	while [[ "-" == "${1%%[!-]!(-)}" ]]
	do set -A kpo -- "${kpo[@]}" "$1"
	shift
	done
	typeset a
	if [[ '--' == "$1" ]] then shift; else
		# for a; do [ "-" == "${1%%[!-]*}" ]
		[ ${#kpo[@]} -ne 0 -a $# -ne 0 ] && {
			until let $#  || [[ '--' == $1 ]]
			do set -A kpo -- "${kpo[@]}" "$1"
			shift; done; let $# ||
		{ >&2 echo "option placement ambiguity, use '--' please."
		return 1; }; }
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