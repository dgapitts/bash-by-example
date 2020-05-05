#!/bin/bash
### cleanup old file (touch in case of !exists)
touch random.log;rm random.log
### generate 30000 random numbers before 0 and 10000 ... the 95th should be 'around 9500' (i.e  +/-100)
for i in {1..30000}; do echo $(( ( RANDOM % 10000 )  )) >> random.log;done
### and the 95th percent is
cat random.log | awk '{print $1}'|sort -n | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'

