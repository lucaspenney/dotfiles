#!/bin/bash
#Dropbox Status outputs
#Dropbox isn't enabled : "Dropbox"
#Dropbox is startin: "Starting..."
#Dropbox is Syncing: "Syncing ..."
#Dropbox is running: "Up to date..."
STATUS="$(echo `dropbox status` | awk '{print $1;}')"
OUTPUT="unknown"
if [[ $STATUS == *"Dropbox"* ]]; then
	OUTPUT="disabled"
elif [[ $STATUS == *"Starting"* ]]; then
	OUTPUT="starting"
elif [[ $STATUS == *"Syncing"* ]]; then
	OUTPUT="syncing"
elif [[ $STATUS == *"Up"* ]]; then
	OUTPUT="synced"
fi
echo "Dropbox[$OUTPUT]"
