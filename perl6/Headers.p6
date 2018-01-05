#!/usr/bin/env perl6

use Grammar::Tracer;
use Grammar::Role::Span;

grammar Grammar::Headers does Span {
    token TOP {^ <header> \v+ $}

    token hashes { '#'**1..6 }

    token header { (<hashes>) \h+ <span> \h* $0? }
}

my $paragraph = q:to/END/;
### Easy
END
my $parsed = Grammar::Headers.parse($paragraph);
say $parsed;

$paragraph = q:to/END/;
## Easy peasy ##
END

$parsed = Grammar::Headers.parse($paragraph);
say $parsed;




