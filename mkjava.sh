#!/bin/sh
echo "Remove java directory tree"
rm -rf "java"

echo "Make java directories"
mkdir "java"
mkdir "java/classes"
mkdir "java/dist"

echo "Compile .proto classes"
protofiles=`find net -name \*.proto`

for f in $protofiles; do 
    protoc --java_out="java/classes" $f;
    if [ $? -ne 0 ]
    then
        echo 'failed to compile...exiting'
        exit 1
    fi
done

# Store a list of all proto packages
pkglist=""
pushd java/classes > /dev/null
protopkgs=`find . -name \*.java | sed 's#^\./\(.*\)\.java$#\1#' | sed 's#/#.#g'`
for pkg in $protopkgs; do
    pkglist="$pkglist
    , \"$pkg\""
done
pushd net > /dev/null
echo "package net;

public class Init {
   public static final String[] protos = {
      ${pkglist:7}
    };
}" > Init.java
popd > /dev/null
popd > /dev/null

echo "Compile .java classes"
javac -cp protobuf-java-2.3.0.jar `find java/classes/net -name \*.java`

echo "Build jar file"
cd "java/classes"
jar cvf "../dist/ion_proto_0.3.1.jar" `find net -name \*.class`
