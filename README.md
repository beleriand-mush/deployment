# Beleriand MUSH

[![][logo]][logo]

This is the repository for the production deployment of Beleriand MUSH, minus
the sensitive information (e.g., login info, user data, game data). This repo
provides everything you need to get Beleriand back up and running, provided you
have access to the MUSH's backup data.

The MUSH deployment has recently undergone a significant overhaul, as files and
directories were getting quite cluttered (duplicate scripts, inconsistent 
placement and naming of files, multiple backup methods, including timestamping 
files and keeping them in the same directory as deployed files).


## Where Are the Files?

If you're missing something and want to find it, look no further! Before each 
major step of the reorganization, a snapshot (copy) of the game directory was
taken and stored in backups (ask the sys admin if you can't find these). 

While these have not been put into version control, they have been backedup
to multiple locations (and the new scripts in the `bin` directory of the
[docker-repo][Beleriand Dockerfiles repo] provide a convenient means of 
doing this, for those that have access to the production server).

When looking at the backups, if you don't see the particular file you're
seeking, try grep'ing through the backup directory or looking in the 
previous backup.


<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/36963686
[docker-repo]: https://github.com/beleriand-mush/docker