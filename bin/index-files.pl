#!/usr/local/bin/perl
#
# index-events - make an & index topic for events/news/help
#
# Called by compose-tricky
#
# Take a MUSH help.txt format file on the stdin, and write a
# "& entries" entry or entries.
# Lines with entries to be indexed start with &'s.
# Write the resulting entries to the stdout, also in help.txt format,
# in columns and paged.
# Idea by Schmidt@Dune, perl version by Alan Schwartz (Javelin/Paul)
#
# Usage: index-events news [admin] < news.txt > index.news
#

$type = $ARGV[0];
$admin = 1 if ($ARGV[1]);

# Collect all the topic names
while (<STDIN>) {
   chop;
   $admin && /^&\s+(&.*)\s*/ && push(@entries,$1);
   $admin || (/^&\s+([^&].*)\s*/ && push(@entries,$1));
}

# Make 'em all lower-case and sort 'em.
grep(tr/A-Z/a-z/,@entries);
@sorted = sort @entries;

$= = 99999;	# Lines on a page
$- = 99999;	# Lines remaining - start at top of form
$i = 0;
$title = ($admin ? "&" : "") . "Entries";
$titlecount = 1;
$header = 1;
$maxlines = 17;
$maxlen = 25;
$separator ="-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n";

while (@sorted) {
  next if ($_ eq "help");
  if ($header) {
    print STDOUT ($titlecount == 1) ? "\n& $title\n" : "\n& $title-${titlecount}\n";
    print $separator;
    $header = 0;
  }
  $entry1 = shift(@sorted);
  $entry2 = shift(@sorted);
  if (length($entry1) > $maxlen) {
    if (length($entry2) > $maxlen) {
      print $entry1,"\n";
      unshift(@sorted,$entry2);
    } else {
      printf "%-52s%s\n", $entry1, $entry2;
    }
  } else {
    if (length($entry2) > $maxlen) {
      print $entry2,"\n";
    } else {
      $entry3 = shift(@sorted);
      if (length($entry3) > $maxlen) {
        unshift(@sorted,$entry3);
        $entry3 ="";
      }
      write;
    }
  }
  if ($i++ > $maxlines)  {
    $titlecount++;
    print "\nFor more, see $title-${titlecount}\n";
    print $separator;
    $header = 1;
    $i = 0;
  }
}
print $separator;
format STDOUT =           
 @<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<<<<
 $entry1,                  $entry2,                  $entry3
.

