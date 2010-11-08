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
done


echo "Compile .java classes"
javac -cp protobuf-java-2.3.0.jar `find java/classes/net -name \*.java`


echo "Build jar file"
cd "java/classes"
jar cvf "../dist/ion_proto_0.1.jar" `find net -name \*.class`