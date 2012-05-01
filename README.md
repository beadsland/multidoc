

#Welcome to multidoc#


Copyright (c) 2012 Beads D. Land-Trujillo

__Version:__ 0.0.2

__Authors:__ Beads D. Land-Trujillo (_web site:_ [`http://twitter.com/beadsland`](http://twitter.com/beadsland)).

This is a very simple module for using multiple edoc doclets 
at once.

  Sample rebar.config using this doclet:<pre>
 
  {lib_dirs, ["deps"]}.
 
  {edoc_opts, [
 		{doclet, multi_doclet},
 		{doclet_list, [edown_doclet, edoc_doclet]},
 		{skip_libs, ["deps"]},   			# multi_doc will skip these libraries
 		{top_level_readme, {"./README.md", "http://github.com/<i>user</i>/<i>repository</i>"}},
 		{todo, true}
 		]}.
 
  {deps, [
 		{edown, ".\*", {git, "git://github.com/beadsland/edown", {branch, master}}},
 		{multidoc, ".\*", {git, "git://github.com/beadsland/multidoc", {branch, master}}}
 		]}.
  </pre>

##Modules##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="http://github.com/beadsland/multidoc/blob/master/doc/multi_doclet.md" class="module">multi_doclet</a></td></tr></table>

