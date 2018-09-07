-module(handler).
%-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->

	{ok, Connection} = pgsql:connect("localhost", "bogdan" , "25251133parol", [{port, 5432}, {database, "test"}]),
	{ok, Cols, Rows} = pgsql:squery(Connection, "SELECT * FROM user_name;"),


	io:format("Cols ~p\n Rows ~p\n", [Cols, Rows]),

	pgsql:close(Connection),

    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Erlang!">>,
        Req0),
    {ok, Req, State}.  