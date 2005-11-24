#!/usr/bin/perl

require 5;

$#ARGV == 2 || die "ERROR: usage DBPATH BKUPDIR KEEP\n";
 
$data = $ARGV[0];
$backupdir = $ARGV[1];
$keepfiles = $ARGV[2];

# try to link up to date outdb.gz

unlink("#temp#");

$attempts = 3;
while(1) {
  last if link($data, "#temp#");
  sleep 1;
  next if (--$attempts);
  die 'cannot link';
}

# make up name

(@stat = stat("#temp#")) || die "cannot stat";
($sec,$min,$hour,$mday,$mon,$year) = localtime($stat[9]);

if ($year < 100) {
  $ys = sprintf("%02d", $year);
}
else {
  $ys = sprintf("%s%01d", chr(($year-100)/10+65), $year % 10);
}

$newf = sprintf("db-%s.%02d.%02d-%02d:%02d.gz",
                $ys, $mon+1, $mday, $hour, $min);

rename("#temp#", "$backupdir/$newf") || die "cannot rename";

# keep amount of junk small

opendir(DIR, $backupdir) || die "cannot opendir";
@files = sort(grep { /^db/ } readdir(DIR));
closedir(DIR);

if ($#files > $keepfiles) {
  foreach $file(@files[0..$#files - $keepfiles]) {
    unlink("$backupdir/$file");
  }
}

