#!/usr/bin/env perl6

use Test;

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
is( $simple-thing<chunk>.elems, 2, "Two chunks");

my $not-so-simple-paragraph= paragraph.parse("This is *a simple* _paragraph_ with ~~struck~~ words and [links](https://to.nowhere)");
is( $not-so-simple-paragraph<chunk>.elems, 6, "6 chunks");
is( $not-so-simple-paragraph<chunk>[0], "This is", "Chunking OK");



