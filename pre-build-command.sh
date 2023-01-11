#!/usr/bin/env sh

OS_NAME=$(uname)
case $OS_NAME in
  Darwin*)  OS="darwin" ;;
  Linux*)   OS="linux" ;;
  *)        echo "Unexpected OS: $OS_NAME"
            exit 1
            ;;
esac

ARCH=$(uname -m)
case $ARCH in
    x86_64) ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
esac
curl "https://storage.googleapis.com/golang/go1.13.${OS}-${ARCH}.tar.gz" --silent --location | tar -xz

export PATH="$(pwd)/go/bin:$PATH"
