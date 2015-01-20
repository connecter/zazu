-module(ejabberd_auth_encrypted_token).
-author('jvliwanag@gmail.com').

%-behaviour(ejabberd_gen_auth).

-include_lib("mongooseim/apps/ejabberd/include/ejabberd.hrl").

-export([
  login/2,
  set_password/3,
  check_password/3,
  check_password/5,
  try_register/3,
  dirty_get_registered_users/0,
  get_vh_registered_users/1,
  get_vh_registered_users/2,
  get_vh_registered_users_number/1,
  get_vh_registered_users_number/2,
  get_password/2,
  get_password_s/2,
  get_password/3,
  is_user_exists/2,
  remove_user/2,
  remove_user/3,
  plain_password_required/0
]).

-spec login(User :: ejabberd:user(),
            Server :: ejabberd:server()) -> boolean().
login(_User, _Server) -> true.

-spec set_password(User :: ejabberd:user(),
                   Server :: ejabberd:server(),
                   Password :: binary()
                  ) -> ok | {error, not_allowed | invalid_jid}.
set_password(_User, _Server, _Password) -> {error, not_allowed}.

-spec check_password(User :: ejabberd:user(),
                     Server :: ejabberd:server(),
                     Password :: binary()) -> boolean().
check_password(_User, _Server, _Password) -> true.

-spec check_password(User :: ejabberd:user(),
                     Server :: ejabberd:server(),
                     Password :: binary(),
                     Digest :: binary(),
                     DigestGen :: fun()) -> boolean().
check_password(_User, _Server, _Password, _Digest, _DigestGen) -> false.

-spec try_register(User :: ejabberd:user(),
                   Server :: ejabberd:server(),
                   Password :: binary()
                   ) -> {atomic, ok | exists}
                      | {error, invalid_jid | not_allowed} | {aborted, _}.
try_register(_User, _Server, _Password) -> {error, not_allowed}.

-spec dirty_get_registered_users() -> [ejabberd:simple_jid()].
dirty_get_registered_users() -> [].


-spec get_vh_registered_users(Server :: ejabberd:server()
                             ) -> [ejabberd:simple_jid()].
get_vh_registered_users(_Server) -> [].

-spec get_vh_registered_users(Server :: ejabberd:server(),
                              Opts :: list()) -> [ejabberd:simple_jid()].
get_vh_registered_users(_Server, _Opts) -> [].

-spec get_vh_registered_users_number(Server :: ejabberd:server()
                                    ) -> integer().
get_vh_registered_users_number(_Server) -> 0.

-spec get_vh_registered_users_number(Server :: ejabberd:server(),
                                     Opts :: list()) -> integer().
get_vh_registered_users_number(_Server, _Opts) -> 0.

-spec get_password(User :: ejabberd:user(),
                   Server :: ejabberd:server()) -> binary() | false.
get_password(_User, _Server) -> false.

-spec get_password_s(User :: ejabberd:user(),
                     Server :: ejabberd:server()) -> binary().
get_password_s(_User, _Server) -> <<>>.

-spec get_password(User :: ejabberd:user(),
                   Server :: ejabberd:server(),
                   DefaultValue :: binary()) -> binary() | false.
get_password(_User, _Server, DefaultValue) -> DefaultValue.

-spec is_user_exists(User :: ejabberd:user(),
                     Server :: ejabberd:server()
                     ) -> boolean() | {error, atom()}.
is_user_exists(_User, _Server) -> true.

-spec remove_user(User :: ejabberd:user(),
                  Server :: ejabberd:server()
                  ) -> ok | error | {error, not_allowed}.
remove_user(_User, _Server) -> false.

-spec remove_user(User :: ejabberd:user(),
                  Server :: ejabberd:server(),
                  Password :: binary()
                  ) -> ok | not_exists | not_allowed | bad_request | error.
remove_user(_User, _Server, _Password) -> not_allowed.

-spec plain_password_required() -> boolean().
plain_password_required() -> true.
