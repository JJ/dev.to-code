use Grammar::Tracer;

grammar Document {
    token TOP {^ <h1> \v ** 2..*
	       <text>* 
	       <section>*
	       $ }

    token hash { \c[35] }

    token h1 { <hash> \h+ \V+ \h* <hash>? }
    
    token text { .+? \v ** 2 }

    token section { <h2> \v ** 2..*
		    <text>* }
    
    token h2 {<hash>**2 \h+ \V+ \h* (<hash>**2)? }
}

my $paragraph = q:to/END/;
# The beginning

And that is not all

## There is more

What? Still more?

END

my $parsed = Document.parse($paragraph);
say $parsed;

