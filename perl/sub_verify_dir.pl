#!/usr/bin/perl -w
use strict;

test_dir();
test_file();

sub test_dir {
    my $testdir = 'testdir22';
    print is_dir($testdir) ? "$testdir exists\n" : "dir does not exist... [$testdir]\n";
    verify_dir($testdir);
    print is_dir($testdir) ? "$testdir exists\n" : "dir does not exist... [$testdir]\n";
}

sub test_file {
    my $testfile = 'hash12.pl';
    print is_file($testfile) ? "$testfile exists\n" : "file does not exist...[$testfile]\n";
}

sub is_dir {
    my $dir = shift;
    return -d $dir;
}

sub verify_dir {
    my $dir = shift;
    system('mkdir -p ' . $dir) unless (is_dir($dir));
}

sub is_file {
    my $file = shift;
    return -e $file;
}