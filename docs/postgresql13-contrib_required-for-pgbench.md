## postgresql13-contrib required for pgbench

As root
```
   75  yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   76  yum install -y postgresql13-server
   80  yum install -y postgresql13-contrib
```

then as postgres


* pgbench initialiation - with x3 scale (base is 10,000 rows) 

```
-bash-4.2$ /usr/pgsql-13/bin/pgbench -i -s 3
dropping old tables...
NOTICE:  table "pgbench_accounts" does not exist, skipping
NOTICE:  table "pgbench_branches" does not exist, skipping
NOTICE:  table "pgbench_history" does not exist, skipping
NOTICE:  table "pgbench_tellers" does not exist, skipping
creating tables...
generating data (client-side)...
300000 of 300000 tuples (100%) done (elapsed 0.44 s, remaining 0.00 s)
vacuuming...
creating primary keys...
done in 0.83 s (drop tables 0.00 s, create tables 0.01 s, client-side generate 0.52 s, vacuum 0.13 s, primary keys 0.18 s).
```

* pgbench loadtest - 2 clients, 2 threads and for just 5 seconds - 997 tps (excluding connection setup)

```
-bash-4.2$ /usr/pgsql-13/bin/pgbench    -c 2 -j 2 -T 5
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 3
query mode: simple
number of clients: 2
number of threads: 2
duration: 5 s
number of transactions actually processed: 4981
latency average = 2.010 ms
tps = 995.100405 (including connections establishing)
tps = 997.038600 (excluding connections establishing)
```

* pgbench loadtest - 2 clients, 2 threads and for 60 seconds - 904 tps (excluding connection setup)


```
-bash-4.2$ /usr/pgsql-13/bin/pgbench    -c 2 -j 2 -T 60
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 3
query mode: simple
number of clients: 2
number of threads: 2
duration: 60 s
number of transactions actually processed: 54283
latency average = 2.211 ms
tps = 904.647945 (including connections establishing)
tps = 904.806517 (excluding connections establishing) 
```