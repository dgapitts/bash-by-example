
### Script is largely self-explanatory
- cleanup old file (touch in case of !exists)
- generate 30000 random numbers before 0 and 10000 ... the 95th should be 'around 9500' (i.e  +/-100)
- and finally test and se where the actual 95th percentile is 'around 9500' +/-100 (i.e. between 9400 and 9600))

```
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ cat bash_random_and_awk_95th_percentile.sh

### cleanup old file (touch in case of !exists)
touch random.log;rm random.log
### generate 30000 random numbers before 0 and 10000 ... the 95th should be 'around 9500' (i.e  +/-100)
for i in {1..30000}; do echo $(( ( RANDOM % 10000 )  )) >> random.log;done
### and the 95th percent is
cat random.log | awk '{print $1}'|sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'
```
### takes about 2.5secs to run and is 'around 9500' (i.e  +/-100) 
```
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ time ./bash_random_and_awk_95th_percentile.sh
9463

real	0m2.556s
user	0m0.885s
sys	0m1.620s
```
### Spot checks on our 30K random integers between 0 and 9999
```
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ head random.log
6378
5183
979
8984
1941
7901
9674
9724
386
5742
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ tail random.log
246
1655
1317
531
1432
2846
6228
2385
6026
1803
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ grep -c 6228 random.log
4
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ for i in {1000..1005};do echo $i;grep -c $i random.log;done
1000
5
1001
3
1002
2
1003
7
1004
4
1005
0
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ grep -c ^0 random.log
4
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ grep ^0 random.log
0
0
0
0
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ grep ^9999 random.log
9999
9999
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ grep ^10000 random.log
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $
```

