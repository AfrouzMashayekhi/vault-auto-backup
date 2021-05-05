#!/bin/bash
set -xem

consul agent -client 0.0.0.0 -data-dir="/consul/data" -config-dir="/consul/config" &

consul watch -type=keyprefix  -prefix=$KV_PATH/original /auto-backup.sh

fg %1