#!/usr/bin/perl -w

use strict;

my $max = 0; 
my $len1 = 0; 
my $len2 = 0; 

open my $fh, "<" , "../scm/p89.dat";
while(<$fh>){
    chomp;
    $len1 += length($_);
    my $num = &parse_roman($_);
    my $str = &form_roman($num);
    $len2 += length($str);
}
close($fh);

print $len1 - $len2 ."\n";


sub form_roman{
    my $num = shift;
    my $str = "";

    if( $num >= 1000 ){
        $str .= "M" x int($num / 1000);
        $num -= int($num / 1000) * 1000;
    }    
    if( $num >= 900 ){
        $str .= "CM";
        $num -= 900; 
    }    
    elsif( $num >= 500 ){
        $str .= "D" . ("C" x int(($num - 500) / 100));
        $num -= int($num / 100) * 100; 
    }    
    elsif( $num >= 400 ){
        $str .= "CD";
        $num -= 400; 
    }    
    elsif( $num >= 100 ){
        $str .= "C" x int($num / 100);
        $num -= int($num / 100) * 100; 
    }    

    if( $num >= 90 ){
        $str .= "XC";
        $num -= 90;
    }    
    elsif( $num >= 50 ){
        $str .= "L" . ("X" x int(($num - 50) / 10));
        $num -= int($num / 10) * 10;
    }    
    elsif( $num >= 40 ){
        $str .= "XL";
        $num -= 40;
    }
    elsif( $num >= 10 ){
        $str .= "X" x int($num / 10);
        $num -= int($num / 10) * 10;
    }

    if( $num == 9 ){
        $str .= "IX";
        $num -= 9;
    }
    elsif( $num >= 5 ){
        $str .= "V" . ("I" x ($num - 5));
        $num -= $num;
    }
    elsif( $num == 4 ){
        $str .= "IV";
        $num -= 4;
    }
    else{
        $str .= "I" x $num;
        $num -= $num;
    }
    return $str;
}

sub parse_roman{
    my $input = shift;
    my $num = 0;
    my $str = $input;
    while($str){
        if( $str =~ /^(C*)(M+)/ ){
            $num += 1000 * length($2) - 100 * length($1);
        }
        elsif( $str =~ /^(C*)(D+)/ ){
            $num += 500 * length($2) - 100 * length($1);
        }
        elsif( $str =~ /^(X*)(C+)/ ){
            $num += 100 * length($2) - 10 * length($1);
        }
        elsif( $str =~ /^(X*)(L+)/ ){
            $num += 50 * length($2) - 10 * length($1);
        }
        elsif( $str =~ /^(I*)(X+)/ ){
            $num += 10 * length($2) - length($1);
        }
        elsif( $str =~ /^(I*)(V+)/ ){
            $num += 5 * length($2) - length($1);
        }
        elsif( $str =~ /^(I+)/ ){
            $num += length($1);
        }
        else{
            print STDERR "invalid: $input\n";
            return;
        }
        $str = $';
    }
    return $num;
}

