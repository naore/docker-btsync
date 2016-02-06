#!/bin/bash

# make sync folders
mkdir -p /config{/.sync,.legacy-sync}
chown abc:abc /config{/.sync,.legacy-sync}

# test for stable config file in /config
[[ ! -f /config/latest-btsync.conf ]] && cp /defaults/btsync.conf.stable /config/latest-btsync.conf

# test if legacy variable is set true and test for legacy config file
if [[ "$LEGACY" == "true" ]]; then
[[ ! -f /config/legacy-btsync.conf ]] && cp /defaults/btsync.conf.legacy /config/legacy-btsync.conf
echo "using legacy version, config file is \"/config/legacy-btsync.conf\"" 
else
echo "using stable version, config file is \"/config/latest-btsync.conf\"" 
fi

chown abc:abc -R /app/btsync* 
chown abc:abc /config/*btsync.conf




