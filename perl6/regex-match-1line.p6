#!/usr/bin/env perl6

say @*ARGS.map( {$^þ ~~ m:g/\* ~ \* (\w+)/} ).map: { $^þ.perl ~ "\n" };
