#! /usr/bin/perl
#

#use strict;
use DBI;

my $dbh = DBI->connect ('DBI:mysql:groar', 'groar', '');

while (<>) {
	($id, $time) = split;
	if ($id > 0) {
		$sql = "update LOW_PRIORITY comments set comment_date = FROM_UNIXTIME($time) where comment_id=$id";
		print "$sql\n";
		$dbh->do($sql);
	}
}

