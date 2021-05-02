# How to have the latest data every time
using [watches](https://www.consul.io/commands/watch) and [handlers](https://www.consul.io/docs/dynamic-app-config/watches#handlers) in cosul we can monitor for changes in consul
Based on [vault doc](https://learn.hashicorp.com/tutorials/vault/inspecting-data-consul) data of secret enginese saved in logical path of kv
So we should monitor consul kv `kv/vault-ha/logical` and the watch should execute and backup from the consul
In this way we can have automated and updated backup.
# Setup
Run `setup.sh` with the kv store of vault in consul. so, if kv store of vault in Consul is `v1/vault-ha/original` so it will be
`./setup.sh vault-ha <token>` 
# What it does?
Setup script will watch over data of vault secret engines' changes which is persistent in consul, whenever a change happen watch notify handler to trigger
handler run consul snapshot cmd to save a snapshot locally.
Note: for preventing lots of backup creation we will save just the last backup of the day called: `backup-YYYY-mm-dd".back`