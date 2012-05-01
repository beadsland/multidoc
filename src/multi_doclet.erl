%% CDDL HEADER START
%% -----------------------------------------------------------------------
%% The contents of this file are subject to the Common Development and 
%% Distribution License, Version 1.0 (the "License"); you may not use 
%% this file except in compliance with the License.  You should have 
%% received a copy of the Common Development and Distribution License 
%% along with this software.  If not, it can be retrieved online at 
%% http://www.opensource.org/licenses/CDDL-1.0
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.  See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% When distributing Covered Code, include this CDDL Header Notice in
%% each file and include the License file at CDDL-LICENSE.  If applicable
%% add the following below the CDDL Header, with the fields enclosed
%% by brackets replaced by your own identifying information:
%% "Portions Copyright [year] [name of copyright owner]"
%%
%% Copyright 2012 Beads D. Land-Trujillo.  All Rights Reserved
%% -----------------------------------------------------------------------
%% CDDL HEADER END

-include("overview.hrl").
%% @author Beads D. Land-Trujillo [http://twitter.com/beadsland]
%% @copyright 2012 Beads D. Land-Trujillo

%% @version 0.0.2
-module(multi_doclet).
-version("0.0.2").

%%
%% Include files
%%
-include_lib("edoc/include/edoc_doclet.hrl").

%%
%% Exported Functions
%%
-export([run/2]).

%%
%% API Functions
%%

%% @spec (Command::doclet_gen() | doclet_toc(), edoc_context()) -> ok
%% @doc Main doclet entry point. 
run(#doclet_gen{}=Cmd, #context{}=Ctxt) ->
	Doclist = proplists:get_value(doclet_list, Ctxt#context.opts),
	case proplists:get_value(skip_libs, Ctxt#context.opts) of
		undefined	-> io:format("skip libs undef~p~n", [Ctxt#context.opts]),
					   run(Cmd, Ctxt, Doclist);
		Skips		-> run(Cmd, Ctxt, Doclist, Skips)
	end.

%%
%% Local Functions
%%

run(Cmd, Ctxt, Doclist, []) -> run(Cmd, Ctxt, Doclist);
run(Cmd, Ctxt, Doclist, [Skip | Tail]) ->
	Path = proplists:get_value(app_default, Ctxt#context.opts),
	{ok, MP} = re:compile(Skip ++ "$"),
	case re:run(Path, MP) of
		match	->	io:format("Skipping doc for ~s", [Skip]), 
					ok;
		nomatch	->	run(Cmd, Ctxt, Doclist, Tail)
	end.

run(_Cmd, _Ctxt, []) -> ok;
run(Cmd, Ctxt, [Doclet | Tail]) ->
	case run(Cmd, Ctxt, Tail) of
		ok		->	io:format("Running ~p~n", [Doclet]),
					Doclet:run(Cmd, Ctxt);
		Error	->	exit(Error)
	end.
