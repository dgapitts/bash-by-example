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