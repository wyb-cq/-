#!/bin/sh
nginx &
sh /fix-permissions.sh &
tail -f /dev/null
