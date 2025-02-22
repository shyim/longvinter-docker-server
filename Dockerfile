FROM steamcmd/steamcmd:ubuntu-24

ENV CFG_SERVER_NAME="Unnamed Island" \
    CFG_MAX_PLAYERS="32" \
    CFG_SERVER_MOTD="Welcome to Longvinter Island!" \
    CFG_PASSWORD="" \
    CFG_COMMUNITY_WEBSITE="www.longvinter.com" \
    CFG_ADMIN_STEAM_ID="" \
    CFG_ENABLE_PVP="true" \
    CFG_TENT_DECAY="true" \
    CFG_MAX_TENTS="2" \
    CFG_GAME_PORT="7777" \
    CFG_QUERY_PORT="27016"

VOLUME /data
EXPOSE 7777 27016
WORKDIR /data

COPY run.sh /run.sh

ENTRYPOINT []
CMD ["/run.sh"]
