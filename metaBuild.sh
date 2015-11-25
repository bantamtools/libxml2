DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PREFIX=$DIR/.libs

if [ "$1" = "build" ]; then
  (cd $DIR && \
    ./configure --libdir=$PREFIX --without-zlib --without-iconv --without-python --disable-static --enable-shared && \
    make)
elif [ "$1" = "clean" ]; then
  (cd $DIR && \
    make clean)
else
  echo "Missing or unrecognized metabuild argument \"$1\""
  exit 1
fi