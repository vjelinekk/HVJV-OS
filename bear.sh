#!/bin/sh
set -e
. ./headers.sh

# Clean any existing compile_commands.json in the project root
rm -f compile_commands.json

# Generate compile_commands.json for each project
for PROJECT in $PROJECTS; do
  (cd $PROJECT && DESTDIR="$SYSROOT" bear -- $MAKE install)
done

# Merge compile_commands.json from each project into a single file
jq -s 'reduce .[] as $item ([]; . + $item)' */compile_commands.json > compile_commands.json

# Clean up the individual project compile_commands.json files
for PROJECT in $PROJECTS; do
  rm $PROJECT/compile_commands.json
done

. ./clean.sh

rm -rf .cache

. ./headers.sh


