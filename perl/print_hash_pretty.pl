#!/usr/bin/perl -w
use strict;

usage_options();
# print max_str_len();
# print "\n";

sub usage_options {
    my %uopts = (
        header => 'make first row bold',
        delete => 'delete csvs when xlsx is written',
        move => 'move xlsx to specified path',
    );

    my $firstColWidth = max_str_len_hash_key(\%uopts);
    my $pformat = "  \033[1m%-" . ($firstColWidth + 4) . "s\033[0m";

    foreach my $k (keys %uopts) {
        printf $pformat, '-' . $k;
        print $uopts{$k} . "\n";
    }
}

sub max_str_len_hash_key {
    my $hash = shift;
    my $max_len = 0;

    foreach my $str (keys %{$hash}) {
        $max_len = length $str unless (length $str < $max_len);
    }

    return $max_len;
}
