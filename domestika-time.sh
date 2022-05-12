#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Antiguedad en Domestika
# @raycast.mode inline
# @raycast.refreshTime 24h
# @raycast.icon images/domestika.png

TIMESTAMP_EVENT=`gdate -d "2019-04-23" +%s`
TIMESTAMP_TODAY=`gdate +%s`

REMAINING=$(($TIMESTAMP_TODAY - $TIMESTAMP_EVENT))

# Calculate the remaining time
years=$((REMAINING / 31536000))
months=$((REMAINING / 2592000))
months=$((months % 12))
days=$((REMAINING / 86400))
days=$((days % 30))

echo "$years años y $months meses y $days días."
