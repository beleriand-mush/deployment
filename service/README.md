# BeleriandMUSH System Service

*For running on Ubuntu*

## Installation

```
$ cp /home/bele/Beleriand/service/beleriand.service /etc/systemd/system
$ systemctl enable beleriand
```

## Status

```
$ systemctl status beleriand 
```

## Reboot

Performing a reboot of the server should result in the service starting automatically.


```
$ systemctl status beleriand 
```
```
● beleriand.service
   Loaded: loaded (/etc/systemd/system/beleriand.service; enabled; vendor preset: enabled)
   Active: inactive (dead) since Thu 2018-05-03 05:31:38 UTC; 1h 10min ago
 Main PID: 3560 (code=exited, status=0/SUCCESS)

May 03 05:31:36 localhost systemd[1]: Started beleriand.service.
May 03 05:31:36 localhost netmushctl[3560]: Starting  ...
May 03 05:31:38 localhost netmushctl[3560]: Startup: OK
```
