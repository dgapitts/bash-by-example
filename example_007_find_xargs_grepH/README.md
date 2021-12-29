### Setup

I'm looking for CREATE statement examples within a project.

Specifically I want to search all .sql `~/projects/learning-cockroach` including all sub directory.

This can be done neatly by combining `find` with `xargs grep -H` (the -H option is important as it shows the file name) 

```
~/projects/bash-by-example $ cd ~/projects/learning-cockroach
~/projects/learning-cockroach $  find . -name '*sql'|xargs grep -H -i create
./index_demo.sql:CREATE TABLE users (id INT PRIMARY KEY,
./create_users_table_index_and_sample_queries.sql:CREATE TABLE users (id INT PRIMARY KEY,
./create_users_table_index_and_sample_queries.sql:CREATE INDEX my_index ON users (last_name, first_name);
./vehicles_data_with_lat_long.sql:CREATE DATABASE movr;
./vehicles_data_with_lat_long.sql:CREATE TABLE vehicles (
./create-table.sql:create database demo;
./create-table.sql:CREATE TABLE test (a SERIAL PRIMARY KEY, val1 bigint, val2 int, filler string);
./movr/data/vehicles_data_with_lat_long.sql:CREATE TABLE movr.vehicles (
```


