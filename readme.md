# Valheim Docker Server

Starts a Valheim dedicated server inside of a docker container. The server will be available on `<server_ip>:2457`
The game and server is still in early access and so I'll update this container as more information on the server is released.

Sometimes the server can take a while to show up in the community server list in game. If you can't find then try the following:

* In Steam go to view > servers
* Click the "Add A Server" button in the bottom right
* Type in the server Ip and selected port. `<server_ip>:2457`
* Click "Add this address to favorites"
* Hit the "Refresh" button and your server should be displayed in the list

It can take a few minutes for the server to be available while it downloads the server files and configures itself.

## Env Vars

You can configure some basic server options using the below ENV vars

| Variable        | Description                                     |
|-----------------|-------------------------------------------------|
| SERVER_NAME     | Sets the name of the server. Default: My server |
| SERVER_PASSWORD | Sets the server password. Default: password123  |
| SERVER_WORLD    | Sets the required world ID. Default: Dedicated  |

## Starting the server

Replace `<HOST_STORAGE_DATA_LOCATION>` and `<HOST_STORAGE_CONFIG_LOCATION>` with the paths on your docker host where you would like to persist the container data.

### Docker

```
docker run --name Valheim -d \
	-p 2456-2458:2456-2458/udp \
	--env 'SERVER_NAME=My Valheim Server' \
	--env 'SERVER_PASSWORD=password123' \
	--volume <HOST_STORAGE_DATA_LOCATION>:/root/valheim/data:rw \
	--volume <HOST_STORAGE_CONFIG_LOCATION>:/root/.config/unity3d/IronGate/Valheim:rw \
	taggr/docker-valheim-server:latest
```

### Docker Compose

```
version: '3'

services:
  valheim-server:
    image: taggr/docker-valheim-server:latest
    ports:
      - "2456-2458:2456-2458/udp"
    volumes:
      - "<HOST_STORAGE_DATA_LOCATION>:/root/valheim/data:rw"
      - "<HOST_STORAGE_CONFIG_LOCATION>:/root/.config/unity3d/IronGate/Valheim:rw"
    network_mode: "bridge"
    restart: unless-stopped
    environment:
      - SERVER_NAME=My Valheim Server
      - SERVER_PASSWORD=password123
```

Copy the above into a `docker-compose.yml` file and you can start the server by running `docker-compose up valheim-server` or to start the server in the background `docker-compose up -d valheim-server`

## Updating the server

Just restart the docker container to update the server

## Server Data Persistance

The server data will be persisted in the chosen paths on the host set by `<HOST_STORAGE_DATA_LOCATION>` and `<HOST_STORAGE_CONFIG_LOCATION>` when starting the container.
