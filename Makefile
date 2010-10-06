# See README.txt.

srcdir=net/ooici/data/netcdf/

all: clean python java

java:   protoc javac do_jar java_test
python: protoc

clean:
	rm -f $(srcdir)*.py $(srcdir)*.java $(srcdir)*.pyc $(srcdir)*.class NcProto.jar ProtoTest.class

protoc:
	protoc --java_out=. --python_out=. $(srcdir)*.proto

javac:
	javac -cp protobuf-java-2.3.0.jar $(srcdir)*.java 
	
do_jar:
	jar cvfi NcProto.jar -C $(srcdir)
	
java_test:
	@echo
	@echo "****************** Testing ProtoTest ******************"
	@echo "~~~ Compile ~~~"
	javac -Xlint:unchecked -cp .:protobuf-java-2.3.0.jar:NcProto.jar ProtoTest.java
	@echo
	@echo "~~~ Test ~~~"
	java -cp .:protobuf-java-2.3.0.jar:NcProto.jar ProtoTest