%%%-------------------------------------------------------------------
%%% @author tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2018 11:33
%%%-------------------------------------------------------------------
-module(compat).
-author("tom").


%% API
-export([crypto_sha/1, crypto_md5/1, crypto_rand_bytes/1]).

-ifdef(OTP_RELEASE).
    -if(?OTP_RELEASE >= 20).
        crypto_sha(Val) ->
            crypto:hash(sha, Val).

        crypto_md5(Val) ->
            crypt:hash(md5, Val).

        crypto_rand_bytes(Val) ->
            crypto:strong_rand_bytes(Val).
    -endif.
-else.
    crypto_sha(Val) ->
        crypto:sha(Val).

    crypto_md5(Val) ->
        crypto:md5(Val).

    crypto_rand_bytes(Val) ->
        crypto:rand_bytes(Val).
-endif.
