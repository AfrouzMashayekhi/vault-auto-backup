#!/bin/bash
consul watch -token=$2 -keyprefix=$1/original -type=key ./auto-backup.sh