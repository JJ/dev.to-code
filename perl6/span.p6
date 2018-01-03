use Grammar::Tracer;
use Grammar::Span;
use Test;

my $paragraph = q:to/END/;
Easy
Paragraph
END

isnt Span.parse($paragraph).WHAT, "Any", "Well parsed";
isnt Span.parse("Difficult paragraph.").WHAT, "Any", "Well parsed too";




