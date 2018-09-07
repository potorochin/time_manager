-module(time_manager).
-export([start/0]).

start() ->
	application:start(time_manager).