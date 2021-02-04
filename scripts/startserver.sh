export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

cd /valheim/data && ./valheim_server.x86_64 -name "${SERVER_NAME}" -console +port 2456 -world "Dedicated" -password "${SERVER_PASSWORD}" -public 1 > /dev/null &

export LD_LIBRARY_PATH=$templdpath

echo "Starting server"
echo ""
read -p "Press RETURN to stop server"
echo 1 > server_exit.drp

echo "Server exit signal set"
echo "You can now close this terminal"

