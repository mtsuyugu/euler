#!/usr/bin/perl -w

use strict;

my $i = 10101010; # floor sqrt(102030405060708900) / 100;

while(1) {
   my $n = $i . "70";
   if( &is_valid($n*$n) ){
      print "$n: ". ($n*$n) ."\n";
      last;
   }
   $n = $i . "30";
   if( &is_valid($n*$n) ){
      print "$n: ". ($n*$n) ."\n";
      last;
   }
   $i += 1;
}

sub is_valid {
   my $n = shift;
   return $n =~ /^1\d2\d3\d4\d5\d6\d7\d8\d9\d0$/;
}
