-module(film_gen).
-behaviour(gen_server).

%% API
-export([stop/0, start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).


stop() ->
    gen_server:call(?MODULE, stop).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init(_Args) ->
    {ok, []}.

handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

% helper functions

initialize() ->
    mnesia:create_table(sequence, [{attributes, record_info(fields, sequence)}, {type, set}]),
    case mnesia:dirty_read({sequence, user_id}) of
        [] ->
            mnesia:dirty_write(#sequence{name = user_id, value = 100000});
        _ ->
            ok
    end.

next_id() ->
    {atomic, NewId} = mnesia:transaction(fun () ->
        {sequence, user_id, Value} = mnesia:read({sequence, user_id}, write),
        NewValue = Value + 1,
        mnesia:write(#sequence{name = user_id, value = NewValue}),
        NewValue
    end),
    NewId.