#!/usr/bin/env bash

set -eo pipefail

cd /data

if [ ! -f "/data/LongvinterServer.sh" ]; then
    chown -R steam:steam /data
fi

su steam /home/steam/steamcmd/steamcmd.sh +force_install_dir /data +login anonymous +app_update 1639880 +quit

echo "Setting config variables..."
echo "[/Game/Blueprints/Server/GI_AdvancedSessions.GI_AdvancedSessions_C]" > /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "ServerName=$CFG_SERVER_NAME" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "MaxPlayers=$CFG_MAX_PLAYERS" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "ServerMOTD=$CFG_SERVER_MOTD" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "Password=$CFG_PASSWORD" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "CommunityWebsite=$CFG_COMMUNITY_WEBSITE" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "[/Game/Blueprints/Server/GM_Longvinter.GM_Longvinter_C]" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "AdminSteamID=$CFG_ADMIN_STEAM_ID" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "PVP=$CFG_ENABLE_PVP" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "TentDecay=$CFG_TENT_DECAY" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini
echo "MaxTents=$CFG_MAX_TENTS" >> /data/Longvinter/Saved/Config/LinuxServer/Game.ini

chown 1000:1000 /data/Longvinter/Saved/Config/LinuxServer/Game.ini

echo "Setup done, starting the server..."
exec su steam -- "/data/LongvinterServer.sh" -Port=$CFG_GAME_PORT -QueryPort=$CFG_QUERY_PORT
