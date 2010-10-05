
PROTO_SRC="$PWD/ion_base.proto"

ION_PYTHON_SRC="$PWD/../lcaarch"
ION_JAVA_SRC="$PWD/../ioncore-java/src"

ION_PYTHON_OUT=$ION_PYTHON_SRC"/ion/data/encoders"
ION_JAVA_OUT=$ION_JAVA_SRC

protoc -I=$PWD --python_out=$ION_PYTHON_OUT --java_out=$ION_JAVA_OUT $PROTO_SRC

