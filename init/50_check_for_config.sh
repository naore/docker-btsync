#!/bin/bash

mkdir -p /config/.sync

[[ ! -f /config/latest-btsync.conf ]] && cp /defaults/btsync.conf.stable /config/latest-btsync.conf

if [[ "$LEGACY" == "true" ]]; then
[[ ! -f /config/legacy-btsync.conf ]] && cp /defaults/btsync.conf.legacy /config/legacy-btsync.conf
echo "using legacy version, config file is \"/config/legacy-btsync.conf\"" 
else
echo "using stable version, config file is \"/config/latest-btsync.conf\"" 
fi

chown abc:abc -v /config/*btsync.conf




