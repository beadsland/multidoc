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

%% @doc Multi-document edoc doclet.
%%
%% Sample rebar.config using this doclet:
%% <pre>
%% {lib_dirs, ["deps"]}.
%%
%% {edoc_opts, [
%%		{doclet, multi_doclet},
%%		{doclet_list, [edown_doclet, edoc_doclet]},
%%		{top_level_readme, {"./README.md", "http://github.com/beadsland/nosh"}},
%%		{todo, true}
%%		]}.
%%
%% {deps, [
%%		{edown, ".*", {git, "git://github.com/beadsland/edown", {branch, master}}},
%%		{multidoc, ".*", {git, "git://github.com/beadsland/multidoc", {branch, master}}}
%%		]}.
%% </pre>
%% @end
%% @author Beads D. Land-Trujillo [http://twitter.com/beadsland]
%% @copyright 2012 Beads D. Land-Trujillo

%% @version 0.0.1
-module(multi_doclet).
-version("0.0.1").

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
run(#doclet_gen{}=Cmd, #context{}=Ctxt) ->
	Doclist = proplists:get_value(doclet_list, Ctxt#context.opts),
	run(Cmd, Ctxt, Doclist). 

%%
%% Local Functions
%%

run(_Cmd, _Ctxt, []) -> ok;
run(Cmd, Ctxt, [Doclet | Tail]) ->
	case run(Cmd, Ctxt, Tail) of
		ok		->	io:format("Running ~p~n", [Doclet]),
					Doclet:run(Cmd, Ctxt);
		Error	->	exit(Error)
	end.
