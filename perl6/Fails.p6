grammar Fails {
    regex TOP { \# <stuff> }
    token stuff { \w+ }
}

my $parsed = Fails.parse( "#stuff");
