# bash-by-example
## Introduction

Some notes and examples of bash commands and common command line utilities I frequently use from bash.

A lot of the examples here are similar to stackoverflow threads, but here I get to record my favorite solutions and demo why I like them and give some extra context?



## example 18 - setting terminal on new macbook

Add iterm2 via brew:
```
brew install --cask iterm2
```

Add the following shortcuts
```
alias h='history'
alias h40='history|tail -40'
alias hl='history|less'
alias l40='ls -ltr|tail -40'
alias lt='ls -ltr|tail -10'
alias ht='history|tail -10'
```
Set bash to the default shell
```
# https://superuser.com/questions/48226/how-do-i-set-my-shell-in-mac-os-x
chsh -s /bin/bash
```

## example 17 - getting started with conda and jupyter notebook


* Download anacondo

https://www.anaconda.com/products/distribution

* Setup pandas_playground

```
conda info --envs
conda activate pandas_playground
conda install pandas jupyter bottleneck numexpr matplotlib
conda update --all

```

* Final from terminal 

```
jupyter notebook
```





## example 16 - psql - probably the best command line db editor

* psql -E or set ECHO_HIDDEN to pg_catalog metadata - VERY USEFUL - [details here](docs/psql-E-or-ECHO_HIDDEN.md)

## example 15 - bash loop with limit $1


I've been struggling with running bash loops with input parameters of the format `{1..$1}` ... this never quite works for me (I've tried a few iterations).

The solution appears to be to use a while loop
```
[root@c7-master vagrant]# cat loop.sh 
#echo $1
i=1
while [ "$i" -le "$1" ]; do
   uptime
   sleep 2
   i=$((i+1))
   #echo $i
done
```
e.g.
```
[root@c7-master vagrant]# bash loop.sh 3
 21:26:02 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
 21:26:04 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
 21:26:06 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
[root@c7-master vagrant]# bash loop.sh 4
 21:26:10 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
 21:26:12 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
 21:26:14 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
 21:26:16 up 19 days, 50 min,  2 users,  load average: 0.00, 0.01, 0.05
[root@c7-master vagrant]# 
```

## example 014 - which: command not found

I thought `which` was part of the standard bash shell, apparently not
```
-bash-4.2$ which psql
-bash: which: command not found
-bash-4.2$ exit                     
logout
-bash-4.2# yum install -y which
Loaded plugins: ovl
Resolving Dependencies
--> Running transaction check
---> Package which.x86_64 0:2.20-7.el7 will be installed
--> Finished Dependency Resolution
```

I suspect `which` is standard for rhel and ubuntu, but maybe not in more minimal docker linux images?


## example 013 - adding an alias


Starting with `projects` directory
```
[~] # ls -l | grep proj
drwxrwxr-x 26 dpitts     4096 feb 13 23:26 projects/
```

create an alias `scripts`
```
[~] # ln -s projects scripts
[~] # ls -l | grep proj
drwxrwxr-x 26 dpitts     4096 feb 13 23:26 projects/
lrwxrwxrwx  1 dpitts        8 feb 18 23:01 scripts -> projects/
```
## example 012 - simple load testing via pgbench

* [yum install postgresql](docs/yum-install-postgresql.md)
* [postgresql13-contrib required for pgbench (plus bse usage notes)](docs/postgresql13-contrib_required-for-pgbench.md)

## example_011 atop - yum install and config
* [yum install atop via epel](docs/yum-install-atop-via-epel.md)
* [atop extra config](docs/atop-extra-config.md)
* [htop-intro](docs/htop-intro.md)


## example_010 extra_alias_start_stop_postgres
[Some custom extra alias](example_010_extra_alias_start_stop_postgres/README.md)


## example_009 chmod_read_write_exec
[While git does not support write-only access this is common elsewhere](example_009_chmod_read_write_exec/README.md)

## example_008 bash_awk_sum_stddev
[Using awk to calculate sum and stddev](example_008_bash_awk_sum_stddev/README.md)

## example_007 find_xargs_grepH
[find with xargs and grep -H for deep search](example_007_find_xargs_grepH/README.md)

## example_006 introducing_ShellCheck (to be completed)
[RHEL setup shellcheck](example_006_introducing_ShellCheck/README.md)

## example_005 awk_special_characters
[awk escape characters, single quote and new_lines](example_005_awk_special_characters/README.md)

## example_004 getting_started_with_git
[intro to git cli](example_004_getting_started_with_git/README.md)

## example_003 vscode-bash-debug_setup_and_brew
- While I've routinely worked with bash directly on the command-line (on a daily basis) for almost the last two decades (in the early days I was using ksh and csh), more recently I've started using Visual Studio Code and a debugger extension
- https://github.com/rogalmic/vscode-bash-debug
- https://code.visualstudio.com/docs/editor/debugging
- There are no new scripts here, but some code samples and I do cover different bash versions, in the context of macosx and using brew (the package manager for macosx) to install a second and newer version of bash


## example_002 bash_random_and_awk_95th_percentile
- generate 30000 random numbers before 0 and 9999
- use awk to sort list and extract the 95th percentile, which should be 'around 9500' +/-100 (i.e. between 9400 and 9600))

## example_001 input_flags to scripts and if then elif fi blocks
- if-then-elif... blocks are suprisingly fiddly in bash scripts so watch out for syntax
- ref: https://askubuntu.com/questions/444082/how-to-check-if-1-and-2-are-null
- ref: https://www.thegeekstuff.com/2010/06/bash-if-statement-examples/


## Appendix - background references

- ref: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes
