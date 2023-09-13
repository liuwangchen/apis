#!/bin/sh

set -ex
CURDIR=$(cd $(dirname $0); pwd)
export PATH=$PATH:.

# natsrpc and httprpc
protoc --proto_path=$CURDIR/rpc \
  -I=$CURDIR \
  --go_out=$CURDIR/rpc --go_opt=paths=source_relative \
  --natsrpc_out=$CURDIR/rpc --natsrpc_opt=paths=source_relative \
  $CURDIR/rpc/*/*.proto \

mv $CURDIR/rpc/*/*.go ./pb && rm -f $CURDIR/rpc/*/*.go
