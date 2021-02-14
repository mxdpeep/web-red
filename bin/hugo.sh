#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v go >/dev/null 2>&1 && {
    info go: $(go version)
} || {
    fail Go is not installed!
}

command -v hugo >/dev/null 2>&1 || {
  info "Installing Hugo ..."
  cd ../..
  pwd
  yes_or_no "Install hugo here?" && {
    git clone https://github.com/gohugoio/hugo.git
    cd hugo
    go install --tags extended
  }
} && {
    info Hugo is already installed.
}

exit 0
