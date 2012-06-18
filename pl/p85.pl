
use strict;

my $ROW = 1;
my $COLUMN = 3;
my $X = 0;
my $Y = 0;
my $N = 0;
my $n = 0;

my @RESULT = (0, 0, 0, 0, 100000000);

my $MAX = 2000000;
while($ROW <= 2000){
    $COLUMN = 1;
    my @tmp = (); 
    while(1){
        $n = 0;
        $n = &count_all($COLUMN, $ROW);
        if( $n < $MAX ){
            $X = $COLUMN;
            $Y = $ROW;
            $N = $n; 
        }   
        else{
            if( &diff($N) < &diff($n) ){
                @tmp = ($X, $Y, $X*$Y, $N, &diff($N));
            }   
            else{
                @tmp = ($COLUMN, $ROW, $COLUMN*$ROW, $n, &diff($n));
            }   
            print $tmp[0].", ".$tmp[1].", ". $tmp[2].", ".$tmp[3].", ". $tmp[4]."\n";
            if( $tmp[4] < $RESULT[4] ){
                @RESULT = @tmp;
            }   
            last;
        }   
        $COLUMN += 1;
    }   
    $ROW += 1;
}


print "\n";
print $RESULT[0].", ".$RESULT[1].", ". $RESULT[2].", ".$RESULT[3].", ".$RESULT[4]."\n";
print "$n\n";

sub diff{
    my $n = shift;
    return abs($MAX-$n);
}


sub count_all{
    my($c, $r) = @_;
    my $n = 0;
    for (my $c = 1; $c <= $COLUMN; $c++ ){
        for (my $r = 1; $r <= $ROW; $r++ ){
            my $m = &count($c, $r);
            $n += $m;
        }
    }
    return $n;
}

sub count{
    my($c, $r) = @_;
    return ($COLUMN - $c + 1) * ($ROW - $r + 1);
}


