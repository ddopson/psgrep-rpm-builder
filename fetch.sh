#!/bin/bash
cd "$(dirname "$(readlink -f "$0")")"

VERSION=`cat version`
URL="http://psgrep.googlecode.com/files/psgrep-$VERSION.tar.bz2"
FILE="psgrep-$VERSION.tar.bz2"

echo "Downloading $URL  -->  $FILE ..."
curl -s "$URL" > "$FILE"
tar -xjf "$FILE"
