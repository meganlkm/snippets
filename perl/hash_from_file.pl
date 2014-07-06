#!/usr/bin/perl -w
use strict;

my $filename = 'hash_from_file.conf';
my $delimeter = '\|';

open my $fh, '<', $filename or die "Unable to open file:$!\n";
my %hash = map { chomp; split /$delimeter/; } <$fh>;
close $fh;
print "$_ => $hash{$_}\n" for keys %hash;
