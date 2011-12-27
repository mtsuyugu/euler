#!/usr/bin/perl -w 
use strict;

my @route;
my $i;
my $j;
for( $i = 0; $i < 20; $i++ ){
   $route[0][$i] = 1;
   $route[$i][0] = 1;
}

for( $i = 1; $i < 20; $i++ ){
   for( $j = 1; $j < 20; $j++ ){
      $route[$i][$j] = $route[$i-1][$j] + $route[$i][$j-1];
      print "$i $j ".$route[$i][$j]."\n";
   }
}

print $route[19][19] . "\n";
