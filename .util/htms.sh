#!/usr/bin/env bash
enca -x utf-8 |
iconv -f utf8 -t utf8 |
pandoc -f html -t ms |
nroff -ms
