#!/bin/bash

if [ "$AUTOINDEX" = "on" ];	then
	cp /etc/nginx/sites-available/autoindexoff	/etc/nginx/sites-available/default;
	echo "autoindex toggled OFF";
	export AUTOINDEX=off;
elif [ "$AUTOINDEX" = "off" ]; then
	cp /etc/nginx/sites-available/autoindexon	/etc/nginx/sites-available/default;
	echo "autoindex toggled ON";
	export AUTOINDEX=on;
else
	echo "ERROR: AUTOINDEX has to be 'on' or 'off'"
	echo "try first: 'AUTOINDEX=on' or 'AUTOINDEX=off'"
fi
service nginx reload
