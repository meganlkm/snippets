#!/usr/bin/perl -w
use strict;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0) . '/lib';

use My::Math qw(add);

print add(19, 23);