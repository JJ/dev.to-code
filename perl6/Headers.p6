#!/usr/bin/env perl6

use Grammar::Tracer;
use Grammar::Role::Span;

role Grammar::Role::Hashes[$n=1..6] {
    token hashes( $n ) { '#' ** $n }
}

role Grammar::Role::Header[$n=1] does Grammar::Role::Hashes[$n] {
    regex header( $n ) {^^ (<hashes({$n})>) \h+ <span> [\h* $0]? $$}
}

grammar Grammar::Headers does Grammar::Role::Header[1]  {
    
    
    token TOP {^ <header> \v+ $}

    token header  { <header(1)> }
   
}

my $paragraph = q:to/END/;
### Easy
END
my $parsed = Grammar::Headers.parse($paragraph);
say $parsed;

$paragraph = q:to/END/;
## Easier ##
END
say Grammar::Headers.parse($paragraph);

$paragraph = q:to/END/;
## Easy peasy ##
END

$parsed = Grammar::Headers.parse($paragraph);
say $parsed;

$paragraph = q:to/END/;
## Easy peasy ###
END
say Grammar::Headers.parse($paragraph);

$paragraph = q:to/END/;
## Easy peasy #
END
say Grammar::Headers.parse($paragraph);


