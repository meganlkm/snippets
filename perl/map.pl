#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my $filelist = "one.csv:one,two.csv:two,three.csv:three";

# create hash with data structure
# filename => sheetname
# ie: one.csv => one
my %csvs = map { split /:/, $_ } split /,/, $filelist;
print Dumper \%csvs;

# push hash into array
# each array element contains
# hash with structure noted above
my @csvs = map +{ split /:/, $_ }, split /,/, $filelist;
print Dumper \@csvs;
