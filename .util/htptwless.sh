#!/usr/bin/env bash
exec 3<&0
exec < /dev/tty
COLUMNS=80 \
pandoc -f html -t ~/.util/pandoc-terminal-writer/terminal.lua <(\
	<&3 enca -x utf-8 | iconv -f utf8 -t utf8 \
) |
fold -s |
less -R
