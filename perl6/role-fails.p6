#!/usr/bin/env perl6

role jsonable {
    method to-json( ) { ... }
}

class Bare-Word {
    has $.word;
    method new ( Str $word ) {
	return self.bless( $word );
    }
}

my $that-word = Bare-Word.new( "Hola" ) but role jsonable { method to-json() { return "['$!word']"; } };
