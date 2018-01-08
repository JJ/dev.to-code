#!/usr/bin/env perl6

use Grammar::Tracer;

role Grammar::Role::Hashes[$n=1] {
    token hashes( $n ) { '#' ** {$n} }
}

role Grammar::Role::Header[$n=1]  {
    also does Grammar::Role::Hashes[$n];
    
    token like-a-word { \S+ }
    regex span { <like-a-word>[\s+ <like-a-word>]*? } 

    regex header( $n ) {^^ (<hashes({$n})>) \h+ <span> [\h* $0]? $$}
}

grammar Grammar::Headers does Grammar::Role::Header[1]  {
    
    token TOP {^ <header(1)> \v+ $}
   
}

my $paragraph = q:to/END/;
# Easy peasy #
END

say Grammar::Headers.parse($paragraph);


