* =================================================================================
*
* INSTALLING GOOGLE PROTOCOL BUFFER COMPILER
*
* =================================================================================

1. Download Google Protocol Buffers from:

http://code.google.com/apis/protocolbuffers/

2. cd into the root directory and run "./configure" to configure the package:

3. From w/in the root directory, then type 'make' to compile the package.

4. Run 'make check' to run any self-tests that come with this package.

5. Run 'make install' to install the programs and any data files

6. Place [protobuf root]/src in your .bash_profile:

GOOGLE_PROTO_BUFFERS=/Users/spasco/apps/protobuf-2.3.0
export GOOGLE_PROTO_BUFFERS
PATH=$GOOGLE_PROTO_BUFFERS/src:$PATH


**** Now you should be ready to use mkpython.sh or mkjava.sh to compile jar or
egg files from the proto repository ***

This readme is a work in progress...