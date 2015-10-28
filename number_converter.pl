#!/usr/bin/perl
 
use warnings;
print "\n";
print "################  Hello in decimal/octal converter ################ \n\n";

print "Podaj liczbę którą chcesz konwertować: \n";
chomp(my $liczba_before_convert = <STDIN>);

   if ( !($liczba_before_convert =~ /^[0-9]*$/) ){
      print "Podany ciąg nie jest liczbą \n";
   } elsif ($liczba_before_convert =~ /^0[1-7][0-7]*$/){
      print "Liczba ($liczba_before_convert) jest octalem \n";
      @tablica_before = split //, $liczba_before_convert;
      shift @tablica_before;
      my $arrSize = @tablica_before; 
      #print "Rozmiar tablicy" . $arrSize . "\n";
      $sum = 0;
      foreach (@tablica_before){
	 #  print "$_\n";
	 -- $arrSize;	
	 $sum += $_ * (8 ** $arrSize);
         #  print "Array size : $arrSize\n";
       }
       print "Po konwersji na decymalną wynosi: $sum \n";
    } else {
       print "liczba ( $liczba_before_convert) jest decimal \n";
       my %reszta_array;
       $i = 0;
       do {
	    $reszta = $liczba_before_convert % 8;
	    $reszta_array{$i} = $reszta;
	    $i++;
	    $liczba_before_convert = int($liczba_before_convert / 8);    
	    #print "i " . $i . "\n";	
	    #print  "Reszta" . $reszta . "\n";
 	    #print "Liczba podzielona przez 8" . $liczba_before_convert ."\n"; 
       }while($liczba_before_convert != 0);
	    print "Po konwersji na ósemkowyą wynosi: ";
	    foreach my $key (sort { $b <=> $a} keys %reszta_array) {
    			print $reszta_array{$key};
			}
	 print "\n\n";
    }
#print $liczba_before_convert;


