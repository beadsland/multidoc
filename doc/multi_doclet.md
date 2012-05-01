

#Module multi_doclet#
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)


Multi-document edoc doclet.



Copyright (c) 2012 Beads D. Land-Trujillo

__Version:__ 0.0.1

__Authors:__ Beads D. Land-Trujillo (_web site:_ [`http://twitter.com/beadsland`](http://twitter.com/beadsland)).<a name="description"></a>

##Description##


Sample rebar.config using this doclet:
<pre>
  {lib_dirs, ["deps"]}.
 
  {edoc_opts, [
 		{doclet, multi_doclet},
 		{doclet_list, [edown_doclet, edoc_doclet]},
 		{top_level_readme, {"./README.md", "http://github.com/beadsland/nosh"}},
 		{todo, true}
 		]}.
 
  {deps, [
 		{edown, ".*", {git, "git://github.com/beadsland/edown", {branch, master}}},
 		{multidoc, ".*", {git, "git://github.com/beadsland/multidoc", {branch, master}}}
 		]}.
  </pre><a name="index"></a>

##Function Index##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#run-2">run/2</a></td><td></td></tr></table>


<a name="functions"></a>

##Function Details##

<a name="run-2"></a>

###run/2##




`run(Doclet_gen, Context) -> any()`

