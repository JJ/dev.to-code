use Grammar::Tracer;

# Non-horizontal whitespace
role like-a-word {
    regex like-a-word { «\H+» }
}

role span does like-a-word {
    regex span { <like-a-word>(\s+ <like-a-word>)* } 
}

role pair-quoted does span {
    proto regex quoted {*}
    regex quoted:sym<em> { '*' ~ '*' <span> }
    regex quoted:sym<code> { '`' ~ '`' <span> }
    regex quoted:sym<strong> { '**' ~ '**' <span> }
}

grammar better-paragraph does pair-quoted {
    token TOP { <chunk>[ (\s+) <chunk>]* }
    regex chunk {  <quoted> | <span> }
}

say better-paragraph.parse("Simple **thing**");
say better-paragraph.parse("This is *a simple* paragraph");



