#!/bin/sh
if [ -z "$(type go)" ]; then
  if [ -d "/usr/local/go/bin" ]; then
    PATH=/usr/local/go/bin:$PATH
    export PATH
  else
      echo "Install Go environment."
      exit 1
  fi
fi

ORACLEVERSION=19_20
if [ ! -f "instantclient_$ORACLEVERSION/libclntsh.so" ]; then
    echo "Get Basic package (zip) from https://www.oracle.com/jp/database/technologies/instant-client/linux-x86-64-downloads.html and extract here."
    exit 1
fi
if [ ! -f "instantclient_$ORACLEVERSION/sdk/include/oci8dp.h" ]; then
    echo "Get SDK package (zip) from https://www.oracle.com/jp/database/technologies/instant-client/linux-x86-64-downloads.html and extract here."
    exit 1
fi

PKG_CONFIG_PATH=/work
export PKG_CONFIG_PATH

LD_LIBRARY_PATH=/work/instantclient_$ORACLEVERSION:/lib64
export LD_LIBRARY_PATH

rm -f mporacle
go build

if [ -f "mporacle" ]; then
    echo "SUCCESS"
else
    echo "FAILED"
    exit 1
fi
