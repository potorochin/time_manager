%%%-------------------------------------------------------------------
%% @doc quick_pay top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(time_manager_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: #{id => Id, start => {M, F, A}}
%% Optional keys are restart, shutdown, type, modules.
%% Before OTP 18 tuples must be used to specify a child. e.g.
%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->

	 Dispatch = cowboy_router:compile([
        {'_', [{"/", handler, []}]} ]),

    {ok, _} = cowboy:start_clear(my_http_listener,

        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}),


	io:format("INIT SUPER\n"),
    {ok, { {one_for_all, 0, 1}, []} }.

%%====================================================================
%% Internal functions
%%====================================================================
