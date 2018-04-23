DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SYSTEM_NAME=`uname -s`

if [ "$SYSTEM_NAME" = "Darwin" ];then
  export LIBTOOLIZE=glibtoolize
fi

if [ "$1" = "release" -o "$1" = "debug" ]; then
  (cd $DIR && \
    ./autogen.sh --libdir=$DIR/.libs --without-zlib --without-lzma --without-iconv --disable-static --enable-shared --without-python && \
    make)
elif [ "$1" = "clean" ]; then
  (cd $DIR && \
    make clean)
else
  echo "Missing or unrecognized metabuild argument \"$1\""
  exit 1
fi
