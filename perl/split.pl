#!/usr/bin/env perl -w
use strict;

my $str = 'php:git:mv:rm:chown:mkdir';
my @fields = split /:/, $str;
print join( '', $_ ), "\n" foreach @fields;
