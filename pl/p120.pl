#!/usr/bin/perl -w

use strict;

my $m = 1000;
my $s = 0;
for( $a = 3; $a <= $m; $a++ ){
    $s += $a * ($a - ($a%2?1:2));
}

print $s ."\n";
