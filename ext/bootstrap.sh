#!/usr/bin/bash

cp hooks/post-commit .git/hooks/.

# file conversion
myname=$(uname)

if [ $myname == "MINGW64_NT-6.1"  ]; then
  dos2unix ext/*
fi
