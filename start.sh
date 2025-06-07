#!/bin/bash
cd "$(dirname "$0")"
screen -dmS minecraft java -Xms512M -Xmx768M -jar server.jar nogui
