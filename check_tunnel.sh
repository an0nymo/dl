#!/bin/bash

# update should be done as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

die () {
    echo >&2 "$@"
    exit 1
}

processes=$(ps -C ssh | wc -l)
minimum=2

re='^[0-9]+$'
if ! [[ $processes =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi

if (( processes < minimum )); then
/bin/bash /root/tunnel.sh
fi