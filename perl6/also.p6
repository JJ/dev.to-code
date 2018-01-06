#!/usr/bin/env perl6

role stringifiable {
    method to-string( ) { ... }
}

role jsonable {
    method to-json( ) { ... }
}

class Word does stringifiable does jsonable {
    has $.word;

    method to-string() { return $!word; }
    method to-json() { return "'$!word'"; }
}

my $this-word = Word.new( :word("hala") );
say $this-word.to-json();
