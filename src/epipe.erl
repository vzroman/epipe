
-module(epipe).

%%=================================================================
%% API
%%=================================================================
-export([
  do/2
]).

do([Fun|Rest],Acc0)->
  case try Fun(Acc0) catch _:E:S->{error,{E,S}} end of
    {ok,Acc}->do(Rest,Acc);
    ok->do(Rest,Acc0);
    error->{error,undefined};
    {error,Error}->{error,Error};
    Acc->do(Rest,Acc)
  end;
do([],Acc)->
  {ok,Acc}.