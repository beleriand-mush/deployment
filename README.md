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

If you're missing something and want to find it, look no further!


### Version Control

Non-sensitive information and files have been put into version control. Where
dates of creation and/or edits were, now there are commits. These were made 
with the same dates -- as such, if you wish to see an older version of the 
files, you may [browser the commits][commits] on Github. Furthermore,
if you want to look at previous revisions for an existing file, you can 
browse to that file and click the "history" button to view all the commits for
that file. Here's [the login banner text changes over time][banner-changes].

To quickly search all files in version control for a particular pattern via
the command line, you can use this:

```
$ git grep "PATTERN" $(git rev-list --all)
```

### Backups and Sensitive Info

The game DB and user info has not been put into version control, but rather 
has been backed up. Before each major step of the reorganization, a snapshot 
(copy) of the game directory was taken and stored in backups (ask the sys 
admin if you can't find these). 

While these have not been put into version control, they have been backedup
to multiple locations (and the new scripts in the `bin` directory of the
[Beleriand Dockerfiles repo][docker-repo] provide a convenient means of 
doing this, for those that have access to the production server).

When looking at the backups, if you don't see the particular file you're
seeking, try grep'ing through the backup directory or looking in the 
previous backup.


## Resources

* [Managing PennMUSH](http://community.pennmush.org/node/180)
* [Administration tips](http://community.pennmush.org/node/535)


<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/36963686
[docker-repo]: https://github.com/beleriand-mush/docker
[commits]: https://github.com/beleriand-mush/deployment/commits/master
[banner-changes]: https://github.com/beleriand-mush/deployment/commits/master/game/txt/connect.txt
