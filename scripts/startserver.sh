export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/root/valheim/data/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# use the 64 bit steamclient
cp /root/valheim/data/linux64/steamclient.so /root/valheim/data

# set some env var defaults
SERVER_NAME=${SERVER_NAME:-My\ server}
SERVER_PASSWORD=${SERVER_PASSWORD:-secret}
SERVER_WORLD=${SERVER_WORLD:-Dedicated}

# start the valheim server
cd /root/valheim/data && ./valheim_server.x86_64 -name "${SERVER_NAME}" -console +port 2456 -world "${SERVER_WORLD}}" -password "${SERVER_PASSWORD}" -public 1 > /dev/null &

export LD_LIBRARY_PATH=$templdpath

echo "Starting server"
while wait $!; [ $? != 0 ]; do true; done

