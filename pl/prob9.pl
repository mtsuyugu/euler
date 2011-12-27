#!/usr/bin/perl -w 
use strict;

my $a;
my $b;
my $c;

for( $c = 1; $c < 1000; $c++ ){
   print "#";
   for( $a = 1; $a + $c < 1000; $a++ ){
      $b = 1000 - $c - $a;
      if( $a * $a + $b * $b == $c * $c ){
         print "$a $b $c\n";
         last;
      }
   }
}
