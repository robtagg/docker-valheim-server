#!/bin/bash

echo "---Downloading Server---"
steamcmd +login anonymous +force_install_dir /root/valheim/data +app_update 896660 +quit

exec "$@"
