#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v wget >/dev/null 2>&1 || fail "wget is NOT installed!"

info 'Downloading Go ...'

T="/tmp/go1.15.8.tar.gz"
if [ ! -f "$T" ]; then
  sleep 2
  wget -O $T 'https://dl.google.com/go/go1.15.8.linux-amd64.tar.gz'
fi

info 'Removing old Go ...'
sleep 2

sudo rm -rf /usr/local/go

info 'Installing Go ...'

sudo tar -C /usr/local -xzf $T
/usr/local/go/bin/go version

yes_or_no "Remove temporary file?" && rm -f $T

exit 0
