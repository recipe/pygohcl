#!/usr/bin/env sh

set -e

OS_NAME=$(uname)
case $OS_NAME in
  Darwin*)  OS="darwin" ;;
  Linux*)   OS="linux" ;;
  *)        echo "Unexpected OS: $OS_NAME"
            exit 1
            ;;
esac

if [ -z "$ARCHFLAGS" ]; then
  ARCH=$(uname -m)
else
  ARCH=$ARCHFLAGS
fi

case $ARCH in
    *x86_64)  ARCH="amd64" ;;
    *aarch64) ARCH="arm64" ;;
esac

curl "https://storage.googleapis.com/golang/go1.17.${OS}-${ARCH}.tar.gz" --silent --location | tar -xz
export PATH="$(pwd)/go/bin:$PATH"

echo "OS=$OS"
echo "ARCH=$ARCH"
echo "PATH=$PATH"

