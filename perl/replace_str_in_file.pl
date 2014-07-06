#!/usr/bin/perl -w
use strict;

my $filename = 'test.txt';

my $filestuff = file_get_contents_str($filename);
print $filestuff . "------------\n";

file_str_replace($filename, 'stuff', 'content');

$filestuff = file_get_contents_str($filename);
print $filestuff . "------------\n";


sub file_str_replace {
    my ($file, $old, $new) = @_;
    my $file_content = file_get_contents_str($file);

    $file_content =~ s/$old/$new/g;
    file_write($file, '>', $file_content);
}

sub file_write {
    my ($filename, $opentype, $content) = @_;
    open FILE, $opentype . $filename;
    print FILE $content;
    close FILE;
}

sub file_get_contents {
    my $filename = shift;
    open FILE, '<' . $filename or die $!;
    my @lines = <FILE>;
    close FILE;
    return @lines;
}

sub file_get_contents_str {
    my $filename = shift;
    my @filecontent = file_get_contents($filename);
    return join '', @filecontent;
}