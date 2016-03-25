DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SYSTEM_NAME=`uname -s`

if [ "$SYSTEM_NAME" = "Darwin" ];then
  export LIBTOOLIZE=glibtoolize
fi

if [ "$1" = "build" ]; then
  (cd $DIR && \
    ./autogen.sh --without-zlib --without-iconv && \
    make)
elif [ "$1" = "clean" ]; then
  (cd $DIR && \
    make clean)
else
  echo "Missing or unrecognized metabuild argument \"$1\""
  exit 1
fi
