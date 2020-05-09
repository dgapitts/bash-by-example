# git cli and bash

## git is not bash - although they are "almost synonymous" in some developers minds
While git is not bash, with the popular gitbash (windows) tool (a cut down version bash to allow windows users to run git commands), they are closely linked in many developers minds.

Also using the criteria for my bash-by-example repository
> notes and examples of bash commands and common command line utilities I frequently use from bash

git a very common tool to run from within bash.

## git cli 101 - part one - status add reset commit push commands

Typically when you start working with git, to get your local code into the central repo 
* status - which files have already been commit and which files have modified
* diff - for modified files - what changes have been made (within the file) 
* add  - stage a file for commit
* reset - unstage a file for commit
* commit - all stage files are commit (typical with a short message)
* push - from local to central 

### git status - from within a simple repostory 

I'm on the master branch and have modified a couple of files
```
~/projects/bash-by-example $ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md
	modified:   example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.DS_Store
	.vscode/
	example_002_bash_random_and_awk_95th_percentile/.DS_Store
	example_003_vscode-bash-debug_setup_and_brew/
	random.log
no changes added to commit (use "git add" and/or "git commit -a")
```

### git diff - what change have I made 

Here you can see some updates I made to the README.md file 
```
~/projects/bash-by-example $ git diff README.md
diff --git a/README.md b/README.md
index 9b22197..236f2b0 100644
--- a/README.md
+++ b/README.md
@@ -3,6 +3,13 @@

 Some notes and examples of bash commands and common command-line utilities I frequently use from bash.

+## example_003_vscode-bash-debug_setup_and_brew
+- While I've routinely worked with bash directly on the command-line (on a daily basis) for almost the last two decades (in the early days I was using ksh and csh), more recently I've started using Visual Studio Code and a debugger extension
+- https://github.com/rogalmic/vscode-bash-debug
+- https://code.visualstudio.com/docs/editor/debugging
+- There are no new scripts here, but some code samples and I do cover different bash versions, in the context of macosx and using brew (the package manager for macosx) to install a second and newer version of bash
+
+
 ## example_002_bash_random_and_awk_95th_percentile
 - generate 30000 random numbers before 0 and 9999
 - use awk to sort list and extract the 95th percentile, which should be 'around 9500' +/-100 (i.e. between 9400 and 9600))
@@ -11,3 +18,8 @@ Some notes and examples of bash commands and common command line utilities I fre
 - if-then-elif... blocks are suprisingly fiddly in bash scripts so watch out for syntax
 - ref: https://askubuntu.com/questions/444082/how-to-check-if-1-and-2-are-null
 - ref: https://www.thegeekstuff.com/2010/06/bash-if-statement-examples/
+
+
+## Appendix - background references
+
+- ref: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes
\ No newline at end of file
~/projects/bash-by-example $ git add example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
~/projects/bash-by-example $ git diff example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
~/projects/bash-by-example $ git reset example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
Unstaged changes after reset:
M	README.md
M	example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
```

similarly

```
~/projects/bash-by-example $ git diff example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
diff --git a/example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh b/example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
index 8cb44e2..3a76f54 100755
--- a/example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
+++ b/example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
@@ -1,4 +1,4 @@
-
+#!/bin/bash
 ### cleanup old file (touch in case of !exists)
 touch random.log;rm random.log
 ### generate 30000 random numbers before 0 and 10000 ... the 95th should be 'around 9500' (i.e  +/-100)
```

### git add - staging file for commit 

Note of the two files I've changed above, I'm only staging one for commit:
```
~/projects/bash-by-example $ git add example_002_bash_random_and_awk_95th_percentile/bash_random_and_awk_95th_percentile.sh
```

### git commit - take stage files and build a commit (with short message/description)
```
~/projects/bash-by-example $ git commit -m "extra logic (touch/rm commands) to example002 re-runable with any warnings..."
[master 80df932] extra logic (touch/rm commands) to example002 re-runable with any warnings...
 1 file changed, 1 insertion(+), 1 deletion(-)
```
### git push - to central repo
```
~/projects/bash-by-example $ git push
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 485 bytes | 485.00 KiB/s, done.
Total 4 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:dgapitts/bash-by-example.git
   a3a263f..80df932  master -> master
```
### git log - reviewing recent changes (commited)
```
~/projects/bash-by-example $ git log 2
fatal: ambiguous argument '2': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
~/projects/bash-by-example $ git log
commit 80df932e80409ec8eac7df51332682e7f9ce104f (HEAD -> master, origin/master)
Author: dgapitts <dgapitts@gmail.com>
Date:   Tue May 5 15:10:45 2020 +0000

    extra logic (touch/rm commands) to example002 re-runable with any warnings...

commit a3a263f4554f4f382b589caefff8911c6d8526a0
Author: dgapitts <dgapitts@gmail.com>
Date:   Sun May 3 17:33:29 2020 +0000

    example_002_bash_random_and_awk_95th_percentile
```

### Excluding specific files and/or broader paths/file-types, that you don't want to install

For example the .DS_Store files are autogenerate by MacOSX (ito help the File System browser app)

```
~/projects/bash-by-example $ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.DS_Store
	.vscode/
	example_002_bash_random_and_awk_95th_percentile/.DS_Store
	example_003_vscode-bash-debug_setup_and_brew/.DS_Store
	random.log

no changes added to commit (use "git add" and/or "git commit -a")
```

exclude the files and paths/extensions you never want to add

```
~/projects/bash-by-example $ vi .gitignore
~/projects/bash-by-example $ cat .gitignore
*/.DS_Store
.vscode
.DS_Store
```

and now git status is more readable

```
~/projects/bash-by-example $ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitignore
	random.log
```


