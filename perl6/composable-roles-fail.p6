#!/usr/bin/env perl6

role by-n[Int $n=1] {
    method multiply(Str $str) { return $str x $n; }
}

role by-string[Int $n=1] does by-n[1] {
    method whatever(Str $str) { return $n ~ "→" ~ $.multiply( $str ); }
}

class mighty-þor does by-string[2] {};

say mighty-þor.whatever("*");

