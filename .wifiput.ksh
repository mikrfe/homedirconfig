# unfinished, tough
wifiput() {
	typeset _if="$1"
	shift
	typeset cmd
	set -A cmd -- "$@"
	_wifiput_helper() if [[ $1 == join ]] && [[ $3 == wpakey ]]
	then ${cmd[@]} "$2" "$4"
	else echo "bad: $@"
	fi
	grep -E  '^join' /etc/hostname."$_if" | while read
	do eval _wifiput_helper $REPLY
	done
}
