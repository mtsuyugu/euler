use strict;

print &expect(1, 1, 1, 1) . "\n";

sub expect{
    my ($a, $b, $c, $d) = @_;
    if( $a == 1 && $b == 0 && $c == 0 && $d == 0 ){
        return 1 + &expect(0, 1, 1, 1);
    }
    elsif ( $a == 0 && $b == 1 && $c == 0 && $d == 0 ){
        return 1 + &expect(0, 0, 1, 1);
    }
    elsif ( $a == 0 && $b == 0 && $c == 1 && $d == 0 ){
        return 1;
    }
    elsif ( $a == 0 && $b == 0 && $c == 0 && $d == 1 ){
        return 0;
    }   
    return (
        ($a > 0 ? (&expect($a-1, $b+1, $c+1, $d+1) * $a) : 0)
        + ($b > 0 ? (&expect($a, $b-1, $c+1, $d+1) * $b) : 0)
        + ($c > 0 ? (&expect($a, $b, $c-1, $d+1) * $c) : 0)
        + ($d > 0 ? (&expect($a, $b, $c, $d-1) * $d) : 0)
    ) / ( $a + $b + $c + $d );
}


