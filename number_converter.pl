#!/usr/bin/perl
use strict;
use warnings;

use converter_function qw/octal_to_binar 
			  octal_to_decimal
			  decimal_to_octal
			  binar_to_octal
			  decimal_to_heksa
                         /;

print "\n";
print "################  Hello in decimal/octal converter ################ \n\n";
print "Co chcesz konwertować ?\n";
print "decimal -> octal   # wybierz 1\n";
print "octal   -> decimal # wybierz 2\n";
print "octal   -> binar   # wybierz 3\n";
print "binar   -> octal   # wybierz 4\n";
print "decimal -> heksa   # wybierz 5\n";
print "heksa   -> decimal # wybierz 6\n";


my $choice = <STDIN>;

print "Podaj liczbę którą chcesz konwertować: \n";
chomp(my $liczba_before_convert = <STDIN>);

if ( !($liczba_before_convert =~ /^[0-9A-F]*$/) ){
   print "Podany ciąg nie jest liczbą \n";
}

if( $choice == 1 ){
   
   &decimal_to_octal($liczba_before_convert);

}elsif( $choice == 2 ){

   &octal_to_decimal($liczba_before_convert);   

} elsif ( $choice == 3 ){

   &octal_to_binar($liczba_before_convert);     

} elsif ( $choice == 4 ){

   &binar_to_octal($liczba_before_convert);  

} elsif( $choice == 5 ){

   &decimal_to_heksa($liczba_before_convert); 

} elsif( $choice == 6 ){

   &heksa_to_decimal($liczba_before_convert);
}






