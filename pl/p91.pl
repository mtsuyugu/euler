#!/usr/bin/perl -w

use strict;

my $MAX = 50; 
my $total = 0;
for(my $x = 0; $x <= $MAX; $x++ ){
   for(my $y = 0; $y <= $MAX; $y++ ){
      next if $x == 0 && $y == 0;
      my $num = &find($x, $y);
      $total += $num;
   }   
}

print $total ."\n";

sub find{
   my($x, $y) = @_; 
   my $n = 0; 
   my $i = $x; 
   if( $y == 0 ){
      $n += $MAX ;
   }   
   else {
      my $start = 0;
      my $end = $y - 1;
      if( $x == 0 ){
         $n += 2 * $MAX;
         $start = 1;   
      }
      for( my $i = $x + 1; $i <= $MAX; $i++ ){
         for( my $j = $start; $j <= $end; $j++ ){
            if( $x == 0
                  ? &inner($i - $x, $j - $y, $i, $j) == 0
                  : &check($x, $y, $i, $j) ){
               $n++;
            }
         }
      }
   }
   return $n; 
}


sub check {
   my ($x, $y, $i, $j ) = @_;
   if( &inner($x, $y, $x - $i, $y - $j) != 0
         && &inner($i - $x, $j - $y, $i, $j) != 0 ) ){
      return 0;
   }
   return 1;
}

sub inner {
   my ($a, $b, $c, $d) = @_;
   return $a * $c + $b * $d;
}

