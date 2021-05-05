#!/bin/bash
set -xe
consul snapshot save /backup/backup-$(date "+%Y-%m-%d").back  >> /backup/vault-backup-logs.log 2>&1