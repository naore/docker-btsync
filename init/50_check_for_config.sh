#!/bin/bash

mkdir -p /config/.sync

[[ ! -f /config/btsync.conf ]] && cp /defaults/btsync.conf.stable /config/stable-btsync.conf

if [[ "$LEGACY" == "true" ]]; then
[[ ! -f /config/legacy-btsync.conf ]] && cp /defaults/btsync.conf.legacy /config/legacy-btsync.conf
export APP_PATH="/app/btsync-1.4" CONF_PATH="/config/legacy-btsync.conf"
else
export APP_PATH="/app/btsync-latest" CONF_PATH="/config/stable-btsync.conf"
fi

chown abc:abc -v /config/*btsync.conf




