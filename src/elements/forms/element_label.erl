% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_label).
-include_lib ("wf.hrl").
-export ([reflect/0, render_element/1]).

reflect() -> record_info(fields, label).

get_for_value(Element) when is_tuple(Element) ->
    Base = wf_utils:get_elementbase(Element),
    Base#elementbase.id;
get_for_value(Id) ->
    Id.

render_element(Record) ->
    Body = [
        wf:html_encode(Record#label.text, Record#label.html_encode),
        Record#label.body
    ],
    wf_tags:emit_tag(label, Body, [
        {class, [label, Record#label.class]},
        {style, Record#label.style},
        {for, get_for_value(Record#label.for)}
    ]).
