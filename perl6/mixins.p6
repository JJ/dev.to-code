#!/usr/bin/env perl6

# Thanks to https://perl6advent.wordpress.com/2009/12/18/day-18-roles/
role Words {
    has @.words;
    method to-string( Str $ligature ) {
	return @!words.join( $ligature );
    }
}

class Paragraph does Words {

    submethod BUILD( :@!words ) {
    }
    
    method to-string() {
	return "\n" ~ self.Words::to-string( " " ) ~ "\n";
    }
}

my $sentence = Paragraph.new(words => "these are the words".split(/\s+/));
say $sentence.to-string();
