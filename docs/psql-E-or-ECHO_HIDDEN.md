## psql -E or set ECHO_HIDDEN to pg_catalog metadata - VERY USEFUL


A quick demo

```
postgres=# \set ECHO_HIDDEN on
postgres=# \d
********* QUERY **********
SELECT n.nspname as "Schema",
  c.relname as "Name",
  CASE c.relkind WHEN 'r' THEN 'table' WHEN 'v' THEN 'view' WHEN 'm' THEN 'materialized view' WHEN 'i' THEN 'index' WHEN 'S' THEN 'sequence' WHEN 's' THEN 'special' WHEN 'f' THEN 'foreign table' WHEN 'p' THEN 'partitioned table' WHEN 'I' THEN 'partitioned index' END as "Type",
  pg_catalog.pg_get_userbyid(c.relowner) as "Owner"
FROM pg_catalog.pg_class c
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind IN ('r','p','v','m','S','f','')
      AND n.nspname <> 'pg_catalog'
      AND n.nspname <> 'information_schema'
      AND n.nspname !~ '^pg_toast'
  AND pg_catalog.pg_table_is_visible(c.oid)
ORDER BY 1,2;
**************************

                      List of relations
 Schema |        Name         |       Type        |  Owner   
--------+---------------------+-------------------+----------
 public | pgbench_accounts    | partitioned table | postgres
 public | pgbench_accounts_1  | table             | postgres
 public | pgbench_accounts_10 | table             | postgres
 public | pgbench_accounts_2  | table             | postgres
 public | pgbench_accounts_3  | table             | postgres
 public | pgbench_accounts_4  | table             | postgres
 public | pgbench_accounts_5  | table             | postgres
 public | pgbench_accounts_6  | table             | postgres
 public | pgbench_accounts_7  | table             | postgres
 public | pgbench_accounts_8  | table             | postgres
 public | pgbench_accounts_9  | table             | postgres
 public | pgbench_branches    | table             | postgres
 public | pgbench_history     | table             | postgres
 public | pgbench_tellers     | table             | postgres
 public | t1                  | table             | postgres
(15 rows)
```
now I can adjust the above query
* dynamically generate 'alter table … set (fillfactor=85)' statements 
* I can filter on just the partitions i.e. not the base/parent table (where I don't appear to be allowed to set fillfactor)

```
postgres=# select 'alter table ' || c.relname || ' set (fillfactor=85);' FROM pg_catalog.pg_class c
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind IN ('r','p','v','m','S','f','')
      AND n.nspname <> 'pg_catalog'
      AND n.nspname <> 'information_schema'
      AND n.nspname !~ '^pg_toast'
  AND pg_catalog.pg_table_is_visible(c.oid)
and c.relname like 'pgbench_accounts_%' ORDER BY 1;
                       ?column?                       
------------------------------------------------------
 alter table pgbench_accounts_1 set (fillfactor=85);
 alter table pgbench_accounts_10 set (fillfactor=85);
 alter table pgbench_accounts_2 set (fillfactor=85);
 alter table pgbench_accounts_3 set (fillfactor=85);
 alter table pgbench_accounts_4 set (fillfactor=85);
 alter table pgbench_accounts_5 set (fillfactor=85);
 alter table pgbench_accounts_6 set (fillfactor=85);
 alter table pgbench_accounts_7 set (fillfactor=85);
 alter table pgbench_accounts_8 set (fillfactor=85);
 alter table pgbench_accounts_9 set (fillfactor=85);
(10 rows)
```

