#!/usr/bin/perl
#
#by ..:: crazyjunkie ::.. 2014
use strict;
use warnings;
use Digest::MD5 qw (md5_hex);

while (my $line = <>)
{
  $line =~ s/\n$//;
  $line =~ s/\r$//;

  print md5_hex ($line), "\n";
}
