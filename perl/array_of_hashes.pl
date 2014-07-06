#!/usr/bin/perl -w
use strict;
use Data::Dumper;

# array of one key/value pair
my $filelist = "one.csv:one,two.csv:two,three.csv:three";

my @moreHashes = (
    {
        name => 'Jane Doe',
        address => '123 Main St',
        phone => '123-456-7890'
    },
    {
        name => 'Bob Smith',
        address => '555 State St',
        phone => '555-987-2345'
    }
);

# put list in array of hashes
# this will ensure the order is preserved
print sec_title('put list in array of single hashes');
my @singleHash = map +{ split /:/, $_ }, split /,/, $filelist;
div();

print sec_title('print hash key and value in each array element');

foreach my $h (@singleHash) {
    my ($key, $value) = each %{$h};
    print "key: $key\tvalue: $value\n";
}
div();

print sec_title('print hash values');
print join( "\t", values %$_ ), "\n" foreach @moreHashes;
div();

print sec_title('print hash values sorting keys');
print join( "\t", @$_ { sort keys %$_ } ), "\n" foreach @moreHashes;
div();

# dump the singleHash because using each
# will not reset the cursor to the beginning
# of the hash - this is why using keys is preferred
print sec_title('the single hash array:');
print Dumper \@singleHash;
div();

print sec_title('print hash keys only');
foreach my $h (@singleHash) {
    # assign the hash key to scalar
    my $file = each %{$h};
    print "$file\n";
}
div();


sub sec_title {
    my $msg = shift @_;
    return "\033[1m$msg\033[0m\n";
}

sub div {
    print "\033[33;34m-----------------------\033[0m\n";
}