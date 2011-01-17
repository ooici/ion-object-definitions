#!/bin/sh

protofiles=`find net -name \*.proto`

for f in $protofiles; do 
    protoc --python_out=python $f;
done

dirs=`find python/net -type d`
for d in $dirs; do
    pushd $d > /dev/null

    # Wipe the last build
    rm __init__.py > /dev/null
    touch __init__.py

    popd > /dev/null
done

# Store a list of all proto packages
pkglist=""
pushd python/net > /dev/null
protopkgs=`find . -name \*_pb2.py | sed 's#^\./\(.*_pb2\)\.py$#\1#' | sed 's#/#.#g'`
for pkg in $protopkgs; do
    pkglist="$pkglist\n    , '$pkg'"
done
echo "protos = [\n      ${pkglist:8}\n]" >> __init__.py
popd > /dev/null

