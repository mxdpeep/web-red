#!/bin/sh
#@author Filip Oščádal <oscadal@gscloud.cz>

# check for node.js
command -v node >/dev/null 2>&1 || {
    echo "Installing node.js" >&2
    sudo snap remove node
    sudo snap install node --channel=13/stable --classic
    echo "Please restart this script!!!" >&2
    exit
}

# check for hugo
command -v hugo >/dev/null 2>&1 || {
    echo 'Hugo is not installed!' >&2
    exit
}

# check for yarn
command -v yarn >/dev/null 2>&1 || {
    echo 'Yarn is not installed!' >&2
    exit
}

# install missing modules
echo Installing node.js components
npm i -D cross-env shx

echo -en "Fixing the repository ...\n\n"

sed -i 's/git@github.com:/https:\/\/github.com\//' .gitmodules
git submodule update --init --recursive
sed -i 's/LastMod/Lastmod/g' themes/featherweight/layouts/_default/*

# prepare yarn
rm package-lock.json
yarn install

# start yarn
#yarn start

# you should be able to connect to http://localhost:1313 now

exit 0