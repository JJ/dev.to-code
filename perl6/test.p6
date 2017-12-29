# Non-horizontal whitespace

grammar paragraph  {
    token TOP { <chunk>[ (\s+) <chunk>]* }

    regex like-a-word { «\H+» }

    regex span { <like-a-word>[(\s+) <like-a-word>]* }

    proto regex quoted {*}
    regex quoted:sym<em> { ('*') ~ '*' <span> }
    regex quoted:sym<alsoem> { ('~') ~ '~' <span> }
    regex quoted:sym<code> { ('`') ~ '`' <span> }
    regex quoted:sym<strong> { ('**') ~ '**' <span> }
    regex quoted:sym<strike> { ('~~') ~ '~~' <span> }

    regex link { '[' ~ ']' <span> '(' ~ ')' (\H+) }
    
    regex chunk {  <quoted> | <span> | <link> }
}

my $simple-thing = paragraph.parse("Simple **thing**");
$simple-thing<chunk>.map: { so $^þ<quoted> ??
			    say $^þ<quoted>[0] ~ " → " ~ $^þ<quoted><span> !!
			    $^þ.put};
$simple-thing<chunk>.map: { $^þ.gist.put};

say paragraph.parse("This is *a simple* _paragraph_ with ~~struck~~ words and [links](https://to.nowhere)");



