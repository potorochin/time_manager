PROJECT = time_manager

PROJECT_VERSION = 0.1.0



# deps
DEPS = cowboy jsx epgsql eredis erlsom #reloader
# deps urlseloader

dep_jsx = git https://github.com/talentdeficit/jsx v2.4.0
dep_epgsql = git https://github.com/wg/epgsql 
dep_eredis = git https://github.com/wooga/eredis v1.1.0
dep_erlsom = git https://github.com/willemdj/erlsom master
dep_cowboy = git https://github.com/ninenines/cowboy 2.4.0




# git urls
#RELX_URL = https://github.com/erlware/relx

include erlang.mk

.PHONY: debug

debug: app rel
	cp sys.config _rel/time_manager/releases/1/
	./_rel/$(PROJECT)/bin/$(PROJECT) console

