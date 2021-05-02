#!/usr/bin/env bash
consul snapshot save backup-$(date "+%Y-%m-%d").back vault-backup-logs.log 2>&1