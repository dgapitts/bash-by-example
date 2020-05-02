
### Setup
```
~/projects/bash-by-example/example_001_input_flags $ for i in {1..100};do echo hostname_$i|tee -a ../logs/all_hosts.log;done
hostname_1
hostname_2
hostname_3
..
hostname_98
hostname_99
hostname_100
~/projects/bash-by-example/example_001_input_flags $  tail -5 ../logs/all_hosts.log > ../logs/rerun_hosts.log
~/projects/bash-by-example/example_001_input_flags $
```

### ./input_flags.sh script

```
~/projects/bash-by-example/example_001_input_flags $  cat ./input_flags.sh
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
```
### ./input_flags.sh ran with input flag re-run

```
~/projects/bash-by-example/example_001_input_flags $ ./input_flags.sh re-run
re-run
rerun: using ../logs/rerun_hosts.log
rerun count:
       5 ../logs/rerun_hosts.log

hostname_96
hostname_97
hostname_98
hostname_99
hostname_100
```
### ./input_flags.sh ran with input flag no-host-refresh
```
~/projects/bash-by-example/example_001_input_flags $ ./input_flags.sh no-host-refresh
no-host-refresh
no-host-refresh: so using old ../logs/all_hosts.log file
hostname_1
hostname_2
hostname_3
hostname_4
hostname_5
hostname_6
hostname_7
hostname_8
hostname_9
hostname_10
```
### ./input_flags.sh ran with no input flag 
```
~/projects/bash-by-example/example_001_input_flags $ ./input_flags.sh
default-host-refresh
host refresh: generating new ../logs/all_hosts.log file
hostname_1
hostname_2
hostname_3
hostname_4
hostname_5
hostname_6
hostname_7
hostname_8
hostname_9
hostname_10
```

