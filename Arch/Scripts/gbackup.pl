#!/usr/bin/env perl

# Usage: gbackup.pl <user>
# Clone all the gists of a GitHub user

use strict;
use warnings;

use Git::Raw;
use Pithub::Gists;

my $gist = Pithub::Gists -> new;
my $user = shift or die 'Provide a user name';

my $gists = $gist -> list(user => $user);

while (my $row = $gists -> next) {
	print "Cloning gist '" . $row -> {'id'} . "'...";
	Git::Raw::Repository -> clone($row -> {'git_pull_url'}, $row -> {'id'}, {});
	print " done.\n";
}
