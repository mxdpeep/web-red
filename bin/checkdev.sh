#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v go >/dev/null 2>&1 && {
    info $(go version)
} || {
    info Go is not installed!
}

command -v node >/dev/null 2>&1 && {
    info node $(node --version)
    info npm $(npm --version)
} || {
    info Node is not installed!
}

command -v yarn >/dev/null 2>&1 && {
    info yarn $(yarn --version)
} || {
    info Yarn is not installed!
}

command -v hugo >/dev/null 2>&1 && {
    info $(hugo version)
} || {
    info Hugo is not installed!
}

exit 0
