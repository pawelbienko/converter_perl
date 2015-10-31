package NumberConverter;

use strict;
use warnings;


sub new 
{
    my $class = shift;
    my $self  = {};
    bless $self, $class;
    return $self;
}

sub showMenu {
    print "\n";
    print "################  Hello in decimal/octal converter ################ \n\n";
    print "Co chcesz konwertować ?\n";
    print "decimal -> octal   # wybierz 1\n";
    print "octal   -> decimal # wybierz 2\n";
    print "octal   -> binar   # wybierz 3\n";
    print "binar   -> octal   # wybierz 4\n";
    print "decimal -> heksa   # wybierz 5\n";
    print "heksa   -> decimal # wybierz 6\n";
}

sub showNumberQuestion {
    print "\n Jaką liczbę chcesz konwertować: \n";
}

sub manageConverter {
    my( $self, $choice, $number) = @_;
    my $object = new ConverterManager($choice, $number);
    return $object;
    exit;
}

1;
