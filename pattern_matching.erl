-module(pattern_matching_game).
-export([start_game/0]).

start_game() ->
    Patterns = ["AB", "ABC", "AABBCC", "AAABBBCCC"],
    Pattern = lists:nth(random:uniform(length(Patterns)) + 1, Patterns),
    io:format("Welcome to Pattern Matching Game!~n"),
    io:format("Try to guess the pattern.~n"),
    play_game(Pattern, 1).

play_game(Pattern, Attempts) when Attempts =< 5 ->
    io:format("Attempt ~w: ", [Attempts]),
    io:flush(),
    read_input(Pattern, Attempts).

play_game(Pattern, _) ->
    io:format("You've used all your attempts. The correct pattern was ~s.~n", [Pattern]).

read_input(Pattern, Attempts) ->
    case io:get_line("") of
        Pattern ++ "\n" ->
            io:format("Congratulations! You've guessed the correct pattern: ~s~n", [Pattern]);
        _ ->
            io:format("Incorrect pattern. Try again.~n"),
            play_game(Pattern, Attempts + 1)
    end.
