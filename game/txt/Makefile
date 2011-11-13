#
# This makefile only rebuilds the text files we need it
#
# By default we build help, news, and events.
# To build rules.txt:
#	add rules.idx to the IDX line
#	add rules.txt to the TXT line
# Do the same to build index.txt (but add index.idx and index.txt)

IDX=help.idx news.idx events.idx
TXT=help.txt news.txt events.txt

all: $(IDX)

.SUFFIXES: .txt .idx

# Note: Apparently the Irix 6.2 make doesn't handle $* right in the
# dependency of a suffix rule. If you're on Irix 6.2, remove
# $*.txt from the first line below:
.txt.idx: $*.txt
	../mkindx $*.txt $*.idx

help.txt: hlp/*.hlp compose.sh
	./compose.sh hlp
	mv hlp.txt help.txt

news.txt: nws/*.nws compose.sh
	./compose.sh nws
	mv nws.txt news.txt

events.txt: evt/*.evt compose.sh
	./compose.sh evt
	mv evt.txt events.txt

rules.txt: rules/*.rules compose.sh
	./compose.sh rules

index.txt: index/*.index compose.sh
	./compose.sh index

clean:
	-rm -f $(IDX) $(TXT)
	-rm -f compose.sh
	-rm -f hlp/*.orig hlp/*.rej hlp/\#* hlp/*~

compose.sh: compose.sh.in
	sh compose.sh.in

