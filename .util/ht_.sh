#!/usr/bin/env bash

failover=(
	aercw3m
	ptw
	md
	lynx
	links
	ms
	plain
)

original="$(mktemp)"
exec 3<&0
exec < /dev/tty
dd if=/dev/fd/3 of="$original" 2>&1 | >&2 tail -1
exec 3<&-

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

for i in "${failover[@]}"
do
    >&2 echo "this is ht_, doing $i now"
    temp="$(mktemp)"
    "$DIR/ht$i.sh" < "$original" |
    dd \
    status=none \
    of="$temp" &&
    ([[ -s "$temp" ]] || (>&2 echo "there was zero bytes"; false)) &&
    ([[ $(stat -c %s "$temp") -gt 1 ]] || (>&2 echo "there was just one byte"; false)) &&
    ! (for i in {1..66}; do echo; done | cmp -s "$temp" - && (>&2 echo "that was just 66 newlines"; true)) &&
    (>&2 echo "this is ht_, $i succeeded"; true) &&
    break ||
    (rm "$temp"; false)
done &&
(>&2 echo "this is ht_ loopend, $i succeeded"; rm "$original"; cat "$temp"; rm "$temp"; true) ||
(>&2 echo "this is ht_ loopend printing original"; cat "$original"; rm "$original")
