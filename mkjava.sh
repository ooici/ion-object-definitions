#!/bin/sh

echo "Compile .proto classes"
protofiles=`find net -name \*.proto`

for f in $protofiles; do 
    protoc --java_out=$1 $f;
    if [ $? -ne 0 ]
    then
        echo 'failed to compile...exiting'
        exit 1
    fi
done

# # Store a list of all proto packages
# pkglist=""
# pushd $1 > /dev/null
# protopkgs=`find . -name \*.java | sed 's#^\./\(.*\)\.java$#\1#' | sed 's#/#.#g'`
# for pkg in $protopkgs; do
#     pkglist="$pkglist
#     , \"$pkg\""
# done
# pushd net > /dev/null
# echo "package net;
# 
# public class Init {
#    public static final String[] protos = {
#       ${pkglist:7}
#     };
# }" > Init.java
# popd > /dev/null
# popd > /dev/null