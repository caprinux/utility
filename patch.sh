#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color


read -p "libc name? " libcid
read -p "binary name? " binary

chmod +x ./$binary

bit=$(file $binary | awk -F" " '{print $3}')

if [ -e ~/Tools/libc-database/libs/"$libcid" ]; then
    echo -e "Libc has been ${RED}downloaded${NC}..."
else
    echo -e "Libc ${RED}not yet downloaded${NC}..."
    output=$(~/Tools/libc-database/download $libcid 2>&1)
    if [[ "$output" =~ "Invalid ID".* ]]; then
        echo "invalid id"
        exit
    fi
    echo -e "${RED}Downloaded.${NC}"
fi

ver=${libcid:6:4}

if [[ "$bit" == *"64-bit"* ]]; then
    patchelf --replace-needed libc.so.6 ~/Tools/libc-database/libs/$libcid/libc.so.6 ./$binary #libc-$ver.so ./$binary 
    patchelf --set-interpreter ~/Tools/libc-database/libs/$libcid/ld-linux-x86-64.so.2 ./$binary # ld-$ver.so ./$binary
fi
if [[ "$bit" == *"32-bit"* ]]; then
    patchelf --replace-needed libc.so.6 ~/Tools/libc-database/libs/$libcid/libc.so.6 ./$binary 
    patchelf --set-interpreter ~/Tools/libc-database/libs/$libcid/ld-linux.so.2 ./$binary
fi
echo -e "
${RED} Patching done. ${NC}
"
