#!/usr/bin/env perl6

# Thanks to https://perl6advent.wordpress.com/2009/12/18/day-18-roles/
role Span {
    has @.words;
    method to-string( Str $ligature ) {
	return @!words.join( $ligature );
    }
}

class Quoted does Span {
    has $.quote;

    method to-string( Str $ligature ) {
	return self.þ ~  self.Span::to-string( $ligature ) ~ self.ø;
    }

    method þ () {
	return "<" ~ $!quote ~ ">";
    }

    method ø () {
	return "</" ~ $!quote ~ ">";
    }

}

# Solution found here http://irclog.perlgeek.de/perl6/2015-07-31
class Paragraph {
    has @!chunks;

    method new( *@chunks ) {
	return self.bless(:@chunks);
    }
    
    submethod BUILD( :@!chunks ) {}

    proto stringify-chunk( | ) {*}
    multi stringify-chunk( Quoted $quoted ) {
	return $quoted.to-string( " " );
    }
    multi stringify-chunk( Span $span ) {
	return $span.to-string( " " );
    }

    
    method to-string() {
	return "\n" ~ (@!chunks.map: { stringify-chunk( $^þ ) }).join(" " );
    }
}

class Heading does Span {

    submethod BUILD( :@!words ) {
    }
    
    method to-string() {
	return "\n<h1>" ~ self.Span::to-string( " " ) ~ "</h1>\n";
    }
}

my $span = Span.new(words => "This goes first");
say $span.to-string(" " );

my $quoted =  Quoted.new( words => "This is last",
			  quote => "em" );
say $quoted.to-string( " " );

my $sentence = Paragraph.new( $span, $quoted );

say $sentence.to-string();

my $h1 = Heading.new(words => "Heading there".comb(/\w+/));
say $h1.words;
say $h1.to-string();
