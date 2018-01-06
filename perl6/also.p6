#!/usr/bin/env perl6

role stringifiable {
    method to-string( ) { ... }
}

role jsonable {
    method to-json( ) { ... }
}

class Bare-Word {
    has $.word;
    method new ( Str $word ) {
	return self.bless( $word );
    }
}

class Word  {
    also does stringifiable;
    also does jsonable;
    has $.word;

    method to-string() { return $!word; }
    method to-json() { return "'$!word'"; }
}

my $this-word = Word.new( :word("hala") );
say $this-word.to-json();

my $that-word = Bare-Word.new( "Hola" ) but role jsonable { method to-json() { return "['$!word']"; } };
