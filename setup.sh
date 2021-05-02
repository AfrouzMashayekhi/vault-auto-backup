#!/bin/bash
consul watch -keyprefix=$KV_PATH/original -type=key ./auto-backup.sh