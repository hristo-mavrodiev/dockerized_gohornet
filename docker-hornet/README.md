### GOHORNET DOCKER-COMPOSE
#### Download latest config files from the official gohornet repository with :
THIS MAY OVERWRITE YOUR EXISTING FILES!
```sh
sudo chmod a+x get_files.sh
./get_files.sh
```


#### Verify ownership of the `mainnetdb` and `snapshot` folders:
```sh
sudo chown 65532:65532 mainnetdb
sudo chown 65532:65532 -R snapshot
ls -la
```
#### get the latest gohornet image

```sh
docker pull gohornet/hornet:latest
```

#### Generate static PeerID

```sh
docker run --rm -it gohornet/hornet:latest tools p2pidentity
```
copy your p2p private key inside the config.json:
```
"p2p": {
    "bindMultiAddresses": [
      "/ip4/0.0.0.0/tcp/15600"
    ],
    "connectionManager": {
      "highWatermark": 10,
      "lowWatermark": 5
    },
    "gossipUnknownPeersLimit": 4,
    "identityPrivateKey": "YOUR_P2P_PRIVATE_KEY",
    "peerStore": {
```

#### Generate password for the dashboard

```sh
docker run --rm -it gohornet/hornet:latest tools pwdhash
```
or  
```sh
docker exec -it docker_hornet_hornet_1 /app/hornet tools pwdhash
```

copy your paswordhash and passwordsalt in the config file and set username for the dashboard
```
"dashboard": {
    "bindAddress": "0.0.0.0:8081",
    "auth": {
      "sessionTimeout": "72h",
      "username": "CHANGE_USERNAME",
      "passwordHash": "YOUR_PASSWORD_HASH",
      "passwordSalt": "YOUR_PASSWORD_SALT"
      
```
#### Adjust prunning settings based on your SSD size or target Milestones:

```
 "pruning": {
    "milestones": {
      "enabled": false,
      "maxMilestonesToKeep": 60480
    },
    "size": {
      "enabled": true,
      "targetSize": "30GB", 
```

#### Run the container

```sh
docker-compose up -d
```

#### Stop the container with delay, so db won't be corrupted

```sh
docker-compose down -t 120
```
if the database is corrupted use this command to clean it:
```sh
rm -rf mainnetdb/*
```


#### Find peers manually in discord or with:
 http://nodesharing.wisewolf.de 
 
#### Add them in the peering.json file
 ```{
      "alias": "somename",
      "multiAddress": "/dns/DNSname/tcp/15600/p2p/12xxxxxxxxxxxxxxxxxxxxxxxxxx"
    },
    {
      "alias": "somename2",
      "multiAddress": "/dns/DNSname/tcp/15600/p2p/12xxxxxxxxxxxxxxxxxxxxxxxxxx"
    }
 ```
