#!/usr/bin/env perl -w
use strict;
use Data::Dumper;

my @atest;
my $arr_count = scalar @atest;

div();
print sec_title('print array if it is set');
print @atest ? "@atest\n" : "nothing in array....\n";
print "atest count: [" . scalar @atest . "] arr_count: [" . $arr_count . "]\n";
div();

print sec_title('push stuff into array and set arr_count');
push @atest, 'Moo';
push @atest, 'Foo';
push @atest, 'Bar';
$arr_count = scalar @atest;
div();

print sec_title('print number of array elements');
print scalar @atest . "\n";
div();

print sec_title('print array if it is set');
print @atest ? "@atest\n" : "nothing in array....\n";
print "atest count: [" . scalar @atest . "] arr_count: [" . $arr_count . "]\n";
div();

print sec_title('print the first element');
print shift @atest;
print "\n";
div();

print sec_title('print array if it is set');
print @atest ? "@atest\n" : "nothing in array....\n";
print "atest count: [" . scalar @atest . "] arr_count: [" . $arr_count . "]\n";
div();

print sec_title('shift and pop');
print pop @atest;
print "\n";
print shift @atest;
print "\n";
print "atest count: [" . scalar @atest . "] arr_count: [" . $arr_count . "]\n";
div();

print sec_title('reload array');
@atest = ( 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight' );
$arr_count = scalar @atest;
print "atest count: [" . scalar @atest . "] arr_count: [" . $arr_count . "]\n";
div();


my $cnt = 0;
my $max = (scalar @atest < 5) ? scalar @atest : 5;
my @tmp = map { ++$cnt < $max ? ( ) : $_ } @atest;
print @tmp ? "@tmp\n" : "nothing in array....\n";
# my @tmp = grep { ++$cnt > 5 } @tables;
shift @atest for 1..5;

sub sec_title {
    my $msg = shift @_;
    return "\033[1m$msg\033[0m\n";
}

sub div {
    print "\033[33;34m-----------------------\033[0m\n";
}
