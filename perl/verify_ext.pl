#!/usr/bin/perl -w
use strict;
use File::Basename;

my $theExt = '.xlsx';
my @files = (
    'Users.xlsx',
    'Users.xslx',
    'Users.dot',
    'Users',
);

foreach my $filename (@files) {
    print "sent\t\t$filename\n";
    print "returned\t";
    print verify_outfile_ext($filename);
    div();
}

sub verify_outfile_ext {
    my $outfile = shift;
    my ($basename, $parentdir, $ext) = fileparse($outfile, qr/\.[^.]*$/);

    return $outfile if ($ext eq $theExt);
    return $outfile . $theExt if ($ext eq '');

    $outfile =~ s/$ext/$theExt/g if ($ext ne $theExt);
    return $outfile;
}

sub div {
    print "\n\033[33;34m-----------------------\033[0m\n";
}