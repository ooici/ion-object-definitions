#!/bin/sh
mkdir "java"

echo "Compile .proto classes"
protofiles=`find net -name \*.proto`

for f in $protofiles; do 
    protoc --java_out=java $f;
done


echo "Compile .java classes"
javac -cp protobuf-java-2.3.0.jar `find java/net -name \*.java`
