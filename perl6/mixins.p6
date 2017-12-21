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

class Heading does Words {

    submethod BUILD( :@!words ) {
    }
    
    method to-string() {
	return "\n<h1>" ~ self.Words::to-string( " " ) ~ "</h1>\n";
    }
}

my $sentence = Paragraph.new(words => "these are the words".split(/\s+/));
say $sentence.words;
say $sentence.to-string();

my $h1 = Heading.new(words => "Heading there".comb(/\w+/));
say $h1.words;
say $h1.to-string();
