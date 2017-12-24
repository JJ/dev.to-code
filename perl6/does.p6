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
    regex quoted:sym<alsoem> { '~' ~ '~' <span> }
    regex quoted:sym<code> { '`' ~ '`' <span> }
    regex quoted:sym<strong> { '**' ~ '**' <span> }
    regex quoted:sym<strike> { '~~' ~ '~~' <span> }
}

grammar better-paragraph does pair-quoted {
    token TOP { <chunk>[ (\s+) <chunk>]* }
    regex chunk {  <quoted> | <span> }
}

my $simple-thing = better-paragraph.parse("Simple **thing**");
$simple-thing<chunk>.put;
$simple-thing<chunk>.map: { .put };
say better-paragraph.parse("This is *a simple* _paragraph_ with ~~struck~~ words");



