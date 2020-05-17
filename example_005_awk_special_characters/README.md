### awk escape characters, single quote and new_lines

There are some cases where using variables (i.e. -v flag) can be really useful, so this is something I use from time to time anyway. 

Also returning single-quotes is fiddly and while you do this via complex escape characters, which is the more the popular solution according to stack over, my preferred solution.

```
~/projects/bash-by-example/example_005_awk_notes $ cat aid_to_audit.sql
bench1=> select aid from pgbench_accounts TABLESAMPLE BERNOULLI (0.01) limit 10;
   aid
---------
 1278755
 1287088
 1287743
 1299143
 1309718
 1325306
 1343739
 1345322
 1347080
 1353140
(10 rows)
```
we can now generate our test script 

```
~/projects/bash-by-example/example_005_awk_notes $ head -13 aid_to_audit.sql|tail -10|awk -v q=\' '{print "\\set var_aid " q $1 q "\n\\i audit.sql"}'
\set var_aid '1278755'
\i audit.sql
\set var_aid '1287088'
\i audit.sql
\set var_aid '1287743'
\i audit.sql
\set var_aid '1299143'
\i audit.sql
\set var_aid '1309718'
\i audit.sql
\set var_aid '1325306'
\i audit.sql
\set var_aid '1343739'
\i audit.sql
\set var_aid '1345322'
\i audit.sql
\set var_aid '1347080'
\i audit.sql
\set var_aid '1353140'
\i audit.sql
```


### highlight from stackover 


This isn't the first solution but is my favorite

```
Another option is to pass the single quote as an awk variable:

awk -v q=\' 'BEGIN {FS=" ";} {printf "%s%s%s ", q, $1, q}'

Simpler example with string concatenation:

# Prints 'test me', *including* the single quotes. $ awk -v q=\' '{print q $0 q }' <<<'test me' 'test me'

https://stackoverflow.com/questions/9899001/how-to-escape-a-single-quote-inside-awk
```



