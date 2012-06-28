
my $i = 1;
my $total = 0;
my $MAX = 100000000;
my %OCCUR; 
#my $MAX = 1000;
while(1){
    my $sum = $i*$i;
    if( $sum > $MAX ){
        last;
    }   
    for( my $j =  $i+1; 1; $j++ ){
        $sum += $j * $j; 
        if( $sum > $MAX ){
            last;
        }   
        if( &is_palindomic($sum) ){
            unless( $OCCUR{$sum} ){
#                print "#$sum $i $j\n";
                $OCCUR{$sum} = 1;
                $total += $sum;
            }   
        }   
    }   
    $i++;
}

print "$total\n";

sub is_palindomic {
    my $str = shift;
    return reverse($str) == $str;
}

