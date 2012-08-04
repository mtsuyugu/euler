#!/usr/bin/perl -w

use strict;
use Math::BigInt;

my $n =  Math::BigInt->new('0');
for(my $k = 3; $k < 17; $k++ ){
#   $n += 15*16**($k-1) - 15**$k - 2*14*15**($k-1) + 2*14**$k +  13*14**($k-1)  - 13**$k;
   my $a = Math::BigInt->new(16)->bpow($k-1)->bmul(15);
   my $b = Math::BigInt->new(15)->bpow($k);
   my $c = Math::BigInt->new(15)->bpow($k-1)->bmul(28);
   my $d = Math::BigInt->new(14)->bpow($k)->bmul(2);
   my $e = Math::BigInt->new(14)->bpow($k-1)->bmul(13);
   my $f = Math::BigInt->new(13)->bpow($k);
   $n += $a->bsub($b)->bsub($c)->badd($d)->badd($e)->bsub($f);
}

print $n->as_hex()."\n";
