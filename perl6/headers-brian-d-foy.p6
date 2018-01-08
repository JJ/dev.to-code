#!/usr/bin/env perl6

use Grammar::Tracer;

role Like-a-word {
    regex like-a-word { \S+ }
}

role Span does Like-a-word {
    regex span { <like-a-word>[\s+ <like-a-word>]* }
}

role Hashes[$n=1] {
    token hashes ( $n ) { '#' ** {$n} }
}

grammar Grammar::Headers does Span does Hashes[2] {
    token TOP {^ <header> \v+ $}

    regex header { [(<hashes(2)>) \h*] ~ [\h* $0] <span>  }
}

my $result = Grammar::Headers.parse( "## Easier ##\n" );

say $result;
