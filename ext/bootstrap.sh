#!/usr/bin/bash

cp hooks/post-commit .git/hooks/.

# file conversion
myname=$(uname)

if [ $myname == "MINGW64_NT-6.1"  ]; then
  find . -type f \! -path \*/\.git/\* -exec dos2unix {} \;
  dos2unix .git/hooks/post-commit
fi
