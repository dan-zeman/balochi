#!/usr/bin/env perl
# Adds transliteration of Urdu-like word forms (it should work for Balochi, too).
# Copyright © 2022 Dan Zeman <zeman@ufal.mff.cuni.cz>
# License: GNU GPL

use utf8;
use open ':utf8';
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
binmode(STDERR, ':utf8');
use lib '/home/zeman/projekty/translit/lib';
use translit;
use translit::urdu;
my %prevod;
translit::urdu::inicializovat(\%prevod);

while(<>)
{
    if(m/^[0-9]/)
    {
        s/\r?\n$//;
        my @f = split(/\t/);
        my @misc = $f[9] eq '_' ? () : split(/\|/, $f[9]);
        my $translit = translit::prevest(\%prevod, $f[1]);
        push(@misc, "Translit=$translit");
        $f[9] = join('|', @misc);
        $_ = join("\t", @f)."\n";
    }
    print;
}
