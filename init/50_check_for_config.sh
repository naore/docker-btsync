#!/bin/bash



if [ ! -f /config/btsync.conf ]; then
	echo -n "btsync.conf not found Will install: "
	if [ "$LEGACY" == "true" ]; then
		echo  "version 1.4"
		ln -s /app/btsync /app/btsync-1.4
		cp -v /defaults/btsync.conf.legacy /config/btsync.conf
	else
		echo "latest version"
		ln -s /app/btsync /app/btsync-latest
		cp -v /defaults/btsync.conf.standard /config/btsync.conf
	fi
	chown abc:abc -v /config/btsync.conf
fi

if  [ ! -f /config/btsync.conf.sample ]; then
	echo "Adding sample config to \"/config/btsync.conf.sample\" so you can find options there."
	/sbin/setuser abc /app/btsync --dump-sample-config > /config/btsync.conf.sample
fi

mkdir -p /config/.sync