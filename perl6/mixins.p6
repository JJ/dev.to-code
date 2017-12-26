#!/usr/bin/env perl6

role stringifiable {
    method to-string( Str $ligature ) { ... }
}

# Thanks to https://perl6advent.wordpress.com/2009/12/18/day-18-roles/
role Span does stringifiable {
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

class Heading does Span {

    submethod BUILD( :@!words ) {
    }
    
    method to-string() {
	return "\n<h1>" ~ self.Span::to-string( " " ) ~ "</h1>\n";
    }
}

# Solution found here http://irclog.perlgeek.de/perl6/2015-07-31
class Paragraph {
    has stringifiable @!chunks;

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
    multi stringify-chunk( Heading $heading ) {
	return $heading.to-string();
    }

    
    method to-string() {
	return "\n" ~ (@!chunks.map: { stringify-chunk( $^þ ) }).join(" " );
    }
}


my $heading = Heading.new( words => "Here we are".comb(/\w+/) );
my $span    = Span.new( words => "This goes first");
my $quoted  = Quoted.new( words => "This is last",
			  quote => "em" );


my $sentence = Paragraph.new( $heading, $span, $quoted );

say $sentence.to-string();

