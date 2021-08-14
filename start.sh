#!/bin/bash

set -e
export GODEBUG=netdns=go
export TERM=xterm
exec way --host 0.0.0.0 --port 2022 "$WAY" 2>&1 &
exec moon --conf-path=/app/moon.conf &
exec connop server --port $PORT --keepalive 5s --reverse --socks5 --backend http://0.0.0.0:6034 --auth $CONNOP