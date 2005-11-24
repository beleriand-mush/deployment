#!/usr/bin/perl -w

require 5;

$| = 1;

$#ARGV == 0 || die "ERROR: usage DIR\n";

$dir = $ARGV[0];
chdir($dir) || die "ERROR: cd $dir: $!\n";

opendir(DIR, '.') || die "ERROR: opendir: $!\n";
while (defined($filename = readdir(DIR))) {
	@filestat = stat($filename);
	next unless -f _;
	$mtime = $filestat[9];
	print("$mtime $filename\n");
}
closedir(DIR);
print("\n");

@tarlist = ();
while (<STDIN>) {
	chomp;
	last if $_ eq '';
	push(@tarlist, $_);
}

exit(0) if ($#tarlist < 0);

exec('tar', 'cf', '-', @tarlist);
die "ERROR: exec: $!\n";

