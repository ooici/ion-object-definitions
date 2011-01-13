#!/bin/sh

protofiles=`find net -name \*.proto`

for f in $protofiles; do 
    protoc --python_out=python $f;
done

dirs=`find python/net -type d`
for d in $dirs; do
    pushd $d > /dev/null

    # Wipe the last build
    rm __init__.py

    # Import from child package dirs
    pbdirs=`ls -1d */ 2> /dev/null | sed 's#/##'`
    for pbd in $pbdirs; do
        echo "from $pbd import *" >> __init__.py
    done

    # Import from child package files
    pbfiles=`ls -1 *_pb2.py 2> /dev/null | sed 's#\.py##'`
    for pbf in $pbfiles; do
        echo "from $pbf import *" >> __init__.py
    done

    popd > /dev/null
done
