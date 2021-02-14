#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v nodejs >/dev/null 2>&1 || {
  info "Removing old Node.js ..."
  sudo apt-get remove nodejs npm
  sudo snap remove node

  info "Installing Node.js ..."
  sudo snap install node --channel=13/stable --classic
}

exit 0
