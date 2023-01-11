#!/usr/bin/env sh

OS_NAME=$(uname)
case $OS_NAME in
  Darwin*)  OS="darwin" ;;
  Linux*)   OS="linux" ;;
  *)        echo "Unexpected OS: $OS_NAME"
            exit 1
            ;;
esac

case $ARCHFLAGS in
    *x86_64)  ARCH="amd64" ;;
    *amd64)   ARCH="amd64" ;;
    *aarch64) ARCH="arm64" ;;
    *arm64)   ARCH="arm64" ;;
    *)        echo "Unexpected ARCH: $ARCHFLAGS"
              exit 1
              ;;
esac

curl "https://storage.googleapis.com/golang/go1.13.${OS}-${ARCH}.tar.gz" --silent --location | tar -xz
export PATH="$(pwd)/go/bin:$PATH"

echo "OS=$OS"
echo "ARCH=$ARCH"
echo "PATH=$PATH"

