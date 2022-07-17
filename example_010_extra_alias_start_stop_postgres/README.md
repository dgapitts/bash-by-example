## extra_alias start / stop / status postgres 


For more info on postgres setup on the mac, see [here](https://github.com/dgapitts/pg-ora-demo-scripts/blob/master/docs/Quick-setup-notes-for-Mac.md).


I install postgres via brew

```
~/projects/pg-ora-demo-scripts $ brew info postgres
postgresql: stable 14.4 (bottled), HEAD
Object-relational database system
https://www.postgresql.org/
/usr/local/Cellar/postgresql/14.4 (3,307 files, 45.5MB) *
  Poured from bottle on 2022-06-21 at 13:54:40
From: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/postgresql.rb
License: PostgreSQL
==> Dependencies
Build: pkg-config ✔
Required: icu4c ✔, krb5 ✔, lz4 ✔, openssl@1.1 ✔, readline ✔
==> Options
--HEAD
	Install HEAD version
==> Caveats
To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database

This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgres
For more details, read:
  https://www.postgresql.org/docs/14/app-initdb.html

To restart postgresql after an upgrade:
  brew services restart postgresql
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres
==> Analytics
install: 135,804 (30 days), 395,509 (90 days), 1,527,521 (365 days)
install-on-request: 131,139 (30 days), 382,676 (90 days), 1,472,103 (365 days)
build-error: 23 (30 days)
```

You should add extra alias to your `~/.bash_profile`
```
~/projects/bash-by-example $ tail -3 ~/.bash_profile
alias pg_status='pg_ctl -D /usr/local/var/postgres status'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop'
alias pg_start='pg_ctl -D /usr/local/var/postgres start'
```

or you can just run it directly
```
~/projects/pg-ora-demo-scripts $ alias pg_status='pg_ctl -D /usr/local/var/postgres status'
~/projects/pg-ora-demo-scripts $ pg_status
pg_ctl: no server running
~/projects/pg-ora-demo-scripts $ alias pg_stop='pg_ctl -D /usr/local/var/postgres stop'
~/projects/pg-ora-demo-scripts $ alias pg_start='pg_ctl -D /usr/local/var/postgres start'
```

and then trying this 



```
~/projects/pg-ora-demo-scripts/demo $ pg_status
pg_ctl: no server running
~/projects/pg-ora-demo-scripts/demo $ pg_start
pg_ctl: another server might be running; trying to start server anyway
waiting for server to start.... stopped waiting
pg_ctl: could not start server
Examine the log output.
~/projects/pg-ora-demo-scripts/demo $ pg_status
pg_ctl: server is running (PID: 84327)
/usr/local/Cellar/postgresql/14.4/bin/postgres "-D" "/usr/local/var/postgres"
~/projects/pg-ora-demo-scripts/demo $ pg_stop 
waiting for server to shut down...................x^[[D.x..^[b......................................... failed
pg_ctl: server does not shut down
~/projects/pg-ora-demo-scripts/demo $ pg_status
pg_ctl: server is running (PID: 84340)
/usr/local/Cellar/postgresql/14.4/bin/postgres "-D" "/usr/local/var/postgres"
~/projects/pg-ora-demo-scripts/demo $ pg_stop 
waiting for server to shut down.... done
server stopped
```





