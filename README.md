# bash-by-example
## Introduction

Some notes and examples of bash commands and common command line utilities I frequently use from bash.

A lot of the examples here are similar to stackoverflow threads, but here I get to record my favorite solutions and demo why I like them and give some extra context?

##  example_009_chmod_read_write_exec
[While git does not support write-only access this is common elsewhere](example_009_chmod_read_write_exec/README.md)

## example_008_bash_awk_sum_stddev
[Using awk to calculate sum and stddev](example_008_bash_awk_sum_stddev/README.md)

## example_007_find_xargs_grepH
[find with xargs and grep -H for deep search](example_007_find_xargs_grepH/README.md)

## example_006_introducing_ShellCheck (to be completed)
[RHEL setup shellcheck](example_006_introducing_ShellCheck/README.md)

## example_005_awk_special_characters
[awk escape characters, single quote and new_lines](example_005_awk_special_characters/README.md)

## example_004_getting_started_with_git
[intro to git cli](example_004_getting_started_with_git/README.md)

## example_003_vscode-bash-debug_setup_and_brew
- While I've routinely worked with bash directly on the command-line (on a daily basis) for almost the last two decades (in the early days I was using ksh and csh), more recently I've started using Visual Studio Code and a debugger extension
- https://github.com/rogalmic/vscode-bash-debug
- https://code.visualstudio.com/docs/editor/debugging
- There are no new scripts here, but some code samples and I do cover different bash versions, in the context of macosx and using brew (the package manager for macosx) to install a second and newer version of bash


## example_002_bash_random_and_awk_95th_percentile
- generate 30000 random numbers before 0 and 9999
- use awk to sort list and extract the 95th percentile, which should be 'around 9500' +/-100 (i.e. between 9400 and 9600))

## example_001_input_flags to scripts and if then elif fi blocks
- if-then-elif... blocks are suprisingly fiddly in bash scripts so watch out for syntax
- ref: https://askubuntu.com/questions/444082/how-to-check-if-1-and-2-are-null
- ref: https://www.thegeekstuff.com/2010/06/bash-if-statement-examples/


## Appendix - background references

- ref: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes
