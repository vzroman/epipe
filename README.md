# ecall

Erlang library for piping function calls.

I tried to keep API as simple as possible.

I appreciate any pull requests for bug fixing, tests or extending the functionality.

API
-----
    Sometimes you need to do several transformations on some Input in a raw, 
    and the result of the previous transformation shuold go as the input for 
    the next transformation and so on. If some transformation in the list crashes or 
    returns a error, the whole result of the group transformation turns the error. 
    If all transformations are successfull then the result of the final transformation 
    in the list is the result of the whole transformation.

    This pattern is called 'pipe' and nativily supported in some languages. If you 
    find usefull this pattern for your Erlang application try use this library. 
    It's really simple, example:

        {ok, Output} | {error, Error} = epipe:do([Fun1, Fun2 ... ], Input)
    
    Fun1, Fun2, ... is a function with arity = 1
    Input is an erlang term which will be passed as an argument for Fun1
    Ouput is a result of the last Fun in the list. ATTENTION! If a Fun returns just ok, 
            then it's Input is passed as an Input for the following Fun (side effects only functions)
    Error is error :-)

BUILD
-----
    Add it as a dependency to your application and you are ready (I use rebar3)
    {deps, [
        ......
        {epipe, {git, "git@github.com:vzroman/epipe.git", {branch, "main"}}}
    ]}.

    
