#!/bin/bash
MKTEMP="$(mktemp)" &&
mv -f "$1" "$MKTEMP" &&
mkdir "$1" &&
mv "$MKTEMP" "$1/index.html"
