#!/bin/bash

echo "---Downloading Server---"
steamcmd +login anonymous +force_install_dir /valheim/data +app_update 896660 +quit

exec "$@"
