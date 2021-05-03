# How to have the latest data every time
using [watches](https://www.consul.io/commands/watch) and [handlers](https://www.consul.io/docs/dynamic-app-config/watches#handlers) in cosul we can monitor for changes in consul
Based on [vault doc](https://learn.hashicorp.com/tutorials/vault/inspecting-data-consul) data of secret enginese saved in logical path of kv
So we should monitor consul kv `kv/vault-ha/logical` and the watch should execute and backup from the consul
In this way we can have automated and updated backup.
# Setup
Run `setup.sh` with the kv store of vault in consul. so, if kv store of vault in Consul is `v1/vault-ha/original` so it will be
`./setup.sh` 
# What it does?
Setup script will watch over data of vault secret engines' changes which is persistent in consul, whenever a change happen watch notify handler to trigger
handler run consul snapshot cmd to save a snapshot locally.
Note: for preventing lots of backup creation we will save just the last backup of the day called: `/backup/backup-YYYY-mm-dd".back` logs will be in `/backup/vault-backup-logs.log`

# Docker way
`docker build -t vault-backup .` create image and you can add it to the consul server with three env: 
```shell
CONSUL_HTTP_TOKEN= <token of consul with acl access>
KV_PATH=<key/vale path of vault in consul>
CONSUL_HTTP_ADDR=<http address of consul for connecting consul agent to>
```
Executing container with args:
```shell
docker run afrouzmash/vault-backup:v1 -it --name vault-backup -e CONSUL_HTTP_TOEKN=blahblah -e KV_APTH=vault-ha -e CONSUL_HTTP_ADDR=http://127.0.0.1:8500 -v /backup:/backup
docker exec -it vault-backup ./setup.sh
```
you can run docker image as an deployment or a sideCar
```shell
kubectl apply -f ./
```
