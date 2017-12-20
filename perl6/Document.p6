use Grammar::Tracer;

grammar Document {
    my $hash = "\c[35]";
    
    regex TOP {^ <h1> \v ** 2..*
	       .*? \v ** 2..*
	       <section>*
	       $ }

    token h1 { $hash \h+ <header> \h* $hash? }
    
    regex section { <h2> \v ** 2..*
		    .*? }
    
    token h2 {$hash**2 \h+ <header> \h* ($hash**2)? }

    token header { \V+ }
}

my $paragraph = q:to/END/;
# The beginning

And that is not all

## There is more

What? Still more?

END

my $parsed = Document.parse($paragraph);
say $parsed;
say $parsed<h1>

