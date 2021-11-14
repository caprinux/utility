#!/bin/bash
binary=$1
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ "$#" -ne 2 ]; then
    echo "Usage: gdbxpl <script name> <binary name>"
    exit 1
fi

echo -e "[${RED}*${NC}] Waiting for gdb to start..."

while true; do
    process=$(ps aux | grep "./$2" | grep -v "grep" | awk -F" " '{print $2}')
    if [ -z "$process" ]
    then
        continue
    else
        # pid=$(ps aux | grep "$1" | grep -v grep | grep -v "/bin/bash" | awk -F" " '{print $2}')
        dbg -p $process 
        sleep 1
    fi
done
    
