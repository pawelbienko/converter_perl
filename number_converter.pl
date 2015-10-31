#!/usr/bin/perl
use strict;
use warnings;

use ConverterManager;
use NumberConverter;

my $numberConverter = new NumberConverter();

$numberConverter->showMenu();

my $choice = <STDIN>;

$numberConverter->showNumberQuestion;

my $liczba_before_convert = <STDIN>;

my $converter = $numberConverter->manageConverter($choice, $liczba_before_convert);
print $converter->getNumberConverter();
exit;

chomp(my $liczba_before_convert = <STDIN>);

if ( !($liczba_before_convert =~ /^[0-9A-F]*$/) ){
   print "Podany ciąg nie jest liczbą \n";
   exit;
}

my $object = new ConverterFunction($liczba_before_convert);

if( $choice == 1 ){
   print "Wynik:" . $object->decimal_to_octal() ."\n";
   exit;
}elsif( $choice == 2 ){
   print "Wynik:" . $object->octal_to_decimal() . "\n";   
   exit;
} elsif ( $choice == 3 ){
   print "Wynik:" . $object->octal_to_binar() . "\n";    
   exit;
} elsif ( $choice == 4 ){
   print "Wynik:" . $object->binar_to_octal(). "\n";  
   exit;
} elsif( $choice == 5 ){
   print "Wynik:" . $object->decimal_to_heksa() . "\n"; 
   exit;
} elsif( $choice == 6 ){
   print "Wynik:" . $object->heksa_to_decimal() . "\n";
   exit;
}






