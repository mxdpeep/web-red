#@author Filip Oščádal <oscadal@gscloud.cz>

all: info

info:
	@echo "\e[1;32m👾 Welcome to Red web 👾\n"

	@echo "🆘 \e[0;1mmake checkdev\e[0m - check dev dependecies"
	@echo "🆘 \e[0;1mmake setdev\e[0m - install & set dev dependecies"
	@echo "🆘 \e[0;1mmake installnode\e[0m - install node.js v13"
	@echo "🆘 \e[0;1mmake installgo\e[0m - install Go lang"
	@echo "🆘 \e[0;1mmake installhugo\e[0m - install HUGO site generator\n"

	@echo "🆘 \e[0;1mmake build\e[0m - build static site"
	@echo "🆘 \e[0;1mmake icons\e[0m - build favicons"
	@echo "🆘 \e[0;1mmake sync\e[0m - sync to dev site\n"

installnode:
	@echo "🔨 \e[1;32m Installing ...\e[0m"
	@bash ./bin/nodejs13.sh

installgo:
	@echo "🔨 \e[1;32m Installing ...\e[0m"
	@sudo bash ./bin/go.sh

installhugo:
	@echo "🔨 \e[1;32m Installing ...\e[0m"
	@bash ./bin/hugo.sh

setdev:
	@echo "🔨 \e[1;32m Installing ...\e[0m"
	@bash ./bin/setdev.sh

sync:
	@echo "🔨 \e[1;32m Syncing ...\e[0m"
	@bash ./bin/sync.sh

icons:
	@echo "🔨 \e[1;32m Converting ...\e[0m"
	@bash ./bin/makeicons.sh

checkdev:
	@echo "🔨 \e[1;32m Checking ...\e[0m"
	@bash ./bin/checkdev.sh

build:
	yarn build
