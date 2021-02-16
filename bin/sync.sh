#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

rsync -ahz --progress --delete-after --delay-updates \
    public/ root@gscfraprod1:/www/web-red-dev.mxd.cz/www/

exit 0