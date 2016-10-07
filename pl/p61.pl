
use strict;
use Data::Dumper;
use List::Util qw(reduce sum);

sub p3 {
	my $n = shift;
	return $n*($n+1)/2;
}

sub p4 {
	my $n = shift;
	return $n*$n;
}

sub p5 {
	my $n = shift;
	return $n*(3*$n-1)/2;
}

sub p6 {
	my $n = shift;
	return $n*(2*$n-1);
}

sub p7 {
	my $n = shift;
	return $n*(5*$n-3)/2;
}

sub p8 {
	my $n = shift;
	return $n*(3*$n-2);
}

sub generate_values {
	my $values = [];
	my $subs = [0, 0, 0, \&p3, \&p4, \&p5, \&p6, \&p7, \&p8];

	foreach my $P (3..8){
		$values->[$P] = {};
		my $list = $values->[$P];
		for(my $i = 1; 1; $i++ ){
			my $k = $subs->[$P]->($i);
			next if $k < 1000;
			last if $k >= 10000;
			my $first2 = substr($k, 0, 2);
			$list->{$first2} = [] unless $list->{$first2};
			push @{$list->{$first2}}, $k;
		}
	}
	return $values;
}


sub debug{
	my($v, $found, $visited, $last2) = @_;
	print "$v [". (reduce {"$a, $b"} @{$found}) . "] ";
	print "[". (reduce {"$a, $b"} @{$visited}) . "] ";
	print $last2."\n";
}


sub search {
	my($found, $visited, $last2, $values) = @_;
	my $v = sum @{$visited};
#	&debug($v, $found, $visited, $last2);
	if( $v == 6 && substr($found->[0], 0, 2) eq $last2 ){
		my $sum = 0;
      foreach my $str (@{$found}){
         print "$str ";
         $sum += $str;
      }
		print "\nsum: $sum\n";
		return 1;
	}
	for( my $r = 8; $r >= 3; $r-- ){
		next if $visited->[$r];
		next unless $values->[$r]->{$last2};
		foreach my $n (@{$values->[$r]->{$last2}}) {
			$visited->[$r] = 1;
			push @{$found}, $n;
			return 1 if &search($found, $visited, substr($n, -2), $values);
			pop @{$found};
			$visited->[$r] = 0;
		}
	}
	return 0;
}

my $values = &generate_values();
#print Dumper($values->[8]);
my $N = 8;

main:
foreach my $k (sort keys %{$values->[$N]}){
	foreach my $n ( @{$values->[$N]->{$k}} ){
		my $visited = [0,0,0,0,0,0,0,0,0];
		$visited->[$N] = 1;
		last main if &search([$n], $visited, substr($n, -2), $values);
	}
}

