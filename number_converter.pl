#!/usr/bin/perl
 
use warnings;
print "\n";
print "################  Hello in decimal/octal converter ################ \n\n";
print "Co chcesz konwertować ?\n";
print "decimal -> octal   # wybierz 1\n";
print "octal   -> decimal # wybierz 2\n";
print "octal   -> binar   # wybierz 3\n";
print "binar   -> octal   # wybierz 4\n";
print "decimal -> heksa   # wybierz 5\n";
print "heksa   -> decimal # wybierz 6\n";


$choice = <STDIN>;

print "Podaj liczbę którą chcesz konwertować: \n";
chomp(my $liczba_before_convert = <STDIN>);

if ( !($liczba_before_convert =~ /^[0-9A-F]*$/) ){
   print "Podany ciąg nie jest liczbą \n";
}

if( $choice == 1 ){

   if ( $liczba_before_convert =~ /^[1-9][0-9]*$/) {
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
    }else{
	print "Something goes wrong\n";
    }

}elsif( $choice == 2 ){

   if ($liczba_before_convert =~ /^[1-7][0-7]*$/){
      print "Liczba ($liczba_before_convert) jest octalem \n";
      @tablica_before = split //, $liczba_before_convert;
      #shift @tablica_before;
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
    }else{
	print "Something goes wrong\n";
    }
} elsif ( $choice == 3 ){

   if ($liczba_before_convert =~ /^[1-7][0-7]*$/){
      print "Liczba ($liczba_before_convert) jest octalem \n";
      @tablica_before = split //, $liczba_before_convert;
      #shift @tablica_before;
      ## tablica z kodami binarnymi dla kolejnych znaków kodu ósemkowego ##
      my %binar_code = (
			0 => "000",
			1 => "001",
			2 => "010",
			3 => "011",
			4 => "100",
			5 => "101",
			6 => "110",
			7 => "111"
			);
      ####
      #my $arrSize = @tablica_before; 
      #print "Rozmiar tablicy" . $arrSize . "\n";
      my $binar_string;
      foreach (@tablica_before){
	 #  print "$_\n";
	 $binar_string .= " $binar_code{$_}";
         #  print "Array size : $arrSize\n";
       }
       print "Po konwersji na binarną wynosi: $binar_string \n";
    }else{
	print "Something goes wrong\n";
    }
} elsif ( $choice == 4 ){

   if ($liczba_before_convert =~ /^[1][0-1]*$/){
      print "Liczba ($liczba_before_convert) jest binarem \n";
      my @tablica_before = split //, $liczba_before_convert;
      my %tablica_after;
      my $i = 1;
      my $id_element = 0;

	$tablica_after{$id_element} = $tablica_before[$id_element];
	shift @tablica_before;

	foreach ( @tablica_before ){
	  if($i % 3 == 0){
	    $id_element ++;
	   }

	  $tablica_after{$id_element} = $tablica_after{$id_element} . $_; #110
	  $i ++
	}
=comment

	foreach $key ( sort { $a <=> $b} keys %tablica_after){
	   print "Key $tablica_after{$key} \n";
	}
=cut
      ## tablica z kodami binarnymi dla kolejnych znaków kodu ósemkowego ##
      my %binar_code = (
			"000" => 0,
			"001" => 1,
			"010" => 2,
			"011" => 3,
			"100" => 4,
			"101" => 5,
			"110" => 6,
			"111" => 7
			);
      ####

      my $binar_string;
      foreach (%tablica_after){
	 #  print "tes $_\n";
	 $binar_string .= "$binar_code{$_}";
       }
       print "Po konwersji na binarną wynosi: $binar_string \n";
    }else{
	print "Something goes wrong\n";
    }
} elsif( $choice == 5 ){

   if ( $liczba_before_convert =~ /^[1-9][0-9]*$/) {

	## tablica z kodami binarnymi dla kolejnych znaków kodu ósemkowego ##
      my %hex_code = (
			0 => "0",
			1 => "1",
			2 => "2",
			3 => "3",
			4 => "4",
			5 => "5",
			6 => "6",
			7 => "7",
			8 => "8",
			9 => "9",
			10 => "A",
			11 => "B",
			12 => "C",
			13 => "D",
			14 => "E",
			15 => "F"
			);
      ####

       print "liczba ( $liczba_before_convert) jest decimal \n";
       my %reszta_array;
       $i = 0;
       do {
	    $reszta = $liczba_before_convert % 16;
	    $reszta_array{$i} = $reszta;
	    $i++;
	    $liczba_before_convert = int($liczba_before_convert / 16);    
	    #print "i " . $i . "\n";	
	    #print  "Reszta" . $reszta . "\n";
 	    #print "Liczba podzielona przez 8" . $liczba_before_convert ."\n"; 
       }while($liczba_before_convert != 0);
	    print "Po konwersji na szesnastkową wynosi: ";
	    foreach my $key (sort { $b <=> $a} keys %reszta_array) {
			print $reszta_array{$key};
    			print $hex_code{$reszta_array{$key}};
			}
	 print "\n\n";
    }else{
	print "Something goes wrong\n";
    }

} elsif( $choice == 6 ){

   if ( $liczba_before_convert =~ /^[1-9A-F][0-9A-F]*$/) {

	## tablica z kodami binarnymi dla kolejnych znaków kodu ósemkowego ##
      my %hex_code = (
			"0" => 0,
			"1" => 1,
			"2" => 2,
			"3" => 3,
			"4" => 4,
			"5" => 5,
			"6" => 6,
			"7" => 7,
			"8" => 8,
			"9" => 9,
			"A" => 10,
			"B" => 11,
			"C" => 12,
			"D" => 13,
			"E" => 14,
			"F" => 15
			);
      ####

       print "liczba ( $liczba_before_convert) jest szesnastkowa \n";
       
       @tablica_before = split //, $liczba_before_convert;
       #shift @tablica_before;
       my $arrSize = @tablica_before; 
       #print "Rozmiar tablicy" . $arrSize . "\n";
       $sum = 0;
       foreach (@tablica_before){
	   print "$_\n";
	 -- $arrSize;	
	 $sum += $hex_code{$_} * (16 ** $arrSize);
         #  print "Array size : $arrSize\n";
       }
	
	    print "Po konwersji na dziesiętną wynosi: ";
	    print "$sum";
	 print "\n\n";
    }else{
	print "Something goes wrong\n";
    }

}



