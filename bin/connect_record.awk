#!/usr/bin/awk -f

BEGIN { record=0; record_time="never" }

function real_conn() {
	real_on=0;
	delete players;
	for (i in conn) {
		dbref=substr(conn[i], index(conn[i], "#"));
		if (!players[dbref]) {
			players[dbref] = conn[i];
			real_on++;
		}
	}
}

function login(tty, time, who) {
	line=substr(tty, 2, index(tty,"/")-2);
	if (conn[line]){ print "GRR: already conn", line};
	conn[line]=who;
	real_conn();
	if (real_on > record) {
		record=real_on;
		record_time=time;
		record_who="";
		for (i in players) { record_who=record_who" "players[i]; }
		#print "new record", record_time, record, record_who;
	}
}

function logout(tty, time, who) {
	line=substr(tty, 2, index(tty,"/")-2);
	if (!conn[line]) { print "GRR: not conn", line};
	delete conn[line];
}

/^..... ........  NET: \[.*\] Created / { login($4, $1" "$2, $6) }
/^..... ........  NET: \[.*\] Connected to / { login($4, $1" "$2, $7) }
/^..... ........  NET: \[.*\] Connected [a-z]+ to / { login($4, $1" "$2, $8) }

/^..... ........  NET: \[.*\] Logout by / && !/<Inactivity Timeout>$/ { logout($4, $1" "$2, $7); }

END { print record_time, record, record_who }
