use Grammar::Tracer;
use Grammar::Span;

grammar Grammar::Headers does Span {
    token TOP {^ <header> \v $}

    token hashes { '#'**1..6 }

    token header { (<hashes>) <span> $0? }
}

my $paragraph = q:to/END/;
### Easy
END

my $parsed = Grammar::Headers.parse($paragraph);
say $parsed;




