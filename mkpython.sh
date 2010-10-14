#!/bin/sh

protofiles=`find net -name \*.proto`

for f in $protofiles; do 
    protoc --python_out=python $f;
done

dirs=`find python/net -type d`
for d in $dirs; do
    touch $d/__init__.py
done
