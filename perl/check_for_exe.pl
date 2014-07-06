#!/usr/bin/env perl -w
use strict;

my @binsToFind = qw(git php chmod blah psql);

foreach my $exe (@binsToFind) {
    my $result = find_exe($exe);
    print $result ? "$result\n" : "no app found [$exe]\n";
}

sub find_exe {
	my $req = shift;
	my $app = `which $req`;
	chomp($app);
	return $app;
}
