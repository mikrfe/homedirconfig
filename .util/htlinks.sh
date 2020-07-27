#!/usr/bin/env bash
exec 3>&0
exec < /dev/tty
STORED="$(mktemp)"
<&3 cat > "$STORED"
links -force-html -dump "file://$STORED"
