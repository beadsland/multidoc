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

%% @doc The `nosh' process module, which handles messaging with a paired 
%% `noterm' process.
%%
%% <b>Draft Notes</b>
%%
%% % A `nosh' process is launched by first starting {@link noterm}, which 
%% handles keyboard input, sending this to the `nosh' process as messages, 
%% and presenting output and errors to the user as they are received in 
%% message form from the `nosh' process.  
%%
%% The `nosh' process continues to run until it receives an end-of-file 
%% message from `noterm'.  This is currently produced by typing a period 
%% (`.') by itself on a line, followed by a `<newline>'.
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
%	run(Cmd, Ctxt, Doclist).
	io:format("~p~n", [Doclist]).

%%
%% Local Functions
%%

run(_Cmd, _Ctxt, []) -> true;
run(Cmd, Ctxt, [Doclet | Tail]) ->
	io:format("Running ~p~n", [Doclet]),
%	Doclet:run(Cmd, Ctxt),
	run(Cmd, Ctxt, Tail).