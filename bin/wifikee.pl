#!/usr/bin/perl
use v5.36;
use strict;
use warnings;
use File::KeePass;

# Unsupported file version2 (262144).
# This script is ditched.

sub tty_password {
	system('stty -echo');
	open(TTY, '<', '/dev/tty') or die;
	$_ = <TTY>;
	my $res = chomp;
	system('stty echo');
	close TTY;
	return $res;
}
my $k = File::KeePass->new;
my @pp = [tty_password(), $ENV{'_KEPDBK'}];
$k->load_db($ENV{'_KEPDB'}, @pp);
my $g = $k->find_group({title => 'wifi'});
open(WI, '<', '/etc/hostname.$ARGV');
while(<WI>) {
$k->add_entry({title => $1, group => $g, username => $1, password => $2})
if /join "?([^" ]+)"? wpakey "?([^" ]+)"?/
}
close(WI);
$k->save_db($ENV{'_KEPDB'}, @pp);