%%
%%

-module(kad_logic).

-include_lib("kad.hrl").

-export([distance/2, generate_node_id/0, floor/1, ceiling/1]).

distance(X, Y) ->
    X bxor Y.

generate_node_id() ->
    crypto:rand_uniform(0, (1 bsl ?KEY_SIZE)).

floor(X) when X < 0 ->
    T = trunc(X),
    case X - T == 0 of
        true -> T;
        false -> T - 1
    end;
floor(X) ->
    trunc(X).

ceiling(X) when X < 0 ->
    trunc(X);
ceiling(X) ->
    T = trunc(X),
    case X - T == 0 of
        true -> T;
        false -> T + 1
    end.
