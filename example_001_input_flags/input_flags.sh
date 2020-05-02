#!/bin/bash
# if-then-elif... blocks are suprisingly fiddly in bash scripts so watch out for syntax
# ref: https://www.thegeekstuff.com/2010/06/bash-if-statement-examples/
host_file=''
if [ -z "$1" ];
then 
  host_flag='default-host-refresh'
else
  host_flag=$1
fi

echo $host_flag
#Step 1 - determine hosts to analyze
host_file='../logs/all_hosts.log'
if [ $host_flag == 're-run' ]
then
  echo 'rerun: using ../logs/rerun_hosts.log'
  host_file='../logs/rerun_hosts.log'
  echo 'rerun count: '; wc -l $host_file
  echo
elif [ $host_flag == 'no-host-refresh' ]
then
  echo 'no-host-refresh: so using old ../logs/all_hosts.log file'
elif [ $host_flag == 'default-host-refresh' ]
then
  echo 'host refresh: generating new ../logs/all_hosts.log file'
  rm ../logs/all_hosts.log
  for i in {1..100};do echo hostname_$i >> ../logs/all_hosts.log;done
fi


IFS=$'\n'
for rdsRecord in `cat $host_file|head -10`
do
 echo $rdsRecord
done

