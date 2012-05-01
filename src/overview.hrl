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

% @doc This is a very simple module for using multiple edoc doclets
% at once.
%
%% Sample rebar.config using this doclet:<pre>
%%
%% {lib_dirs, ["deps"]}.
%%
%% {edoc_opts, [
%%		{doclet, multi_doclet},
%%		{doclet_list, [edown_doclet, edoc_doclet]},
%%		{skip_libs, ["deps"]},   			# multi_doc will skip these libraries
%%		{top_level_readme, {"./README.md", "http://github.com/<i>user</i>/<i>repository</i>"}},
%%		{todo, true}
%%		]}.
%%
%% {deps, [
%%		{edown, ".\*", {git, "git://github.com/beadsland/edown", {branch, master}}},
%%		{multidoc, ".\*", {git, "git://github.com/beadsland/multidoc", {branch, master}}}
%%		]}.
%% </pre>
% @end