#!/usr/bin/perl -w
use strict;
my ($s, $filename, $ext);


$s = "123-456-adsf (blah blah) *";
sec_title("parse in 3: $s");
$s =~ /([-a-z0-9]+)\s*\((.*?)\)\s*(\*)?/;
print "$1\n$2\n$3\n";
undef $s;
div();


$s = "u2.csv:10 Users and Stuff,p2.csv:Completions";
sec_title("get stuff between first colon and first comma from: $s");
($filename) = ($s =~ /[-a-z0-9]+\.csv\:(.*?)\,/);
sec_title("remove spaces...");
$filename =~ s/ //g if ($filename);
print "$filename\n";
undef $s;
undef $filename;
div();


$s = "u2.csv";
sec_title("same as previous except string not properly formatted: $s");
($filename) = ($s =~ /[-a-z0-9]+\.csv\:(.*?)\,/);
print "$filename\n";
undef $s;
undef $filename;
div();


$s = 'Users';
sec_title("check for xlsx ext append it if it's not there: $s");
$s = ($s =~ /[-a-z0-9]+\.xlsx/) ? $s : $s . '.xlsx';
print "$s\n";
undef $s;
div();


$s = 'Users.dot';
sec_title("verify correct ext else replace it: $s");
my $myExt = '.xlsx';
($ext) = ($s =~ /[-a-z0-9]+(\..*)$/);
print "$ext\n";
$s =~ s/$ext/$myExt/g unless ($ext eq $myExt);
print "$s\n";
undef $s;
undef $ext;
div();

sub sec_title {
    my $msg = shift @_;
    print "\033[1m$msg\033[0m\n";
}

sub div {
    print "\033[33;34m-----------------------\033[0m\n";
}
