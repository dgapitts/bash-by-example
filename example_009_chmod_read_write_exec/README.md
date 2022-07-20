## Background - git doesn't support write-only

As per this StackOverflow thread asking [how-to-setup-github-write-only-access](https://stackoverflow.com/questions/53122325/how-to-setup-github-write-only-access)

> You cannot do this. You cannot make updates to a Git repository without first reading (cloning) the repository. Git deals in commits, and for a user to create a new commit, they need to have the previous commit and its commit ID.

This slightly counter intuitive, as traditional posix shell as write-only, although as above the git delta based approach means it can not support write-only e.g. this "error: unable to index file" 

```
~/projects/bash-by-example $ git status
On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	example_009_chmod_read_write_exec/test_read_only.log
	example_009_chmod_read_write_exec/test_write_only.log

nothing added to commit but untracked files present (use "git add" to track)
~/projects/bash-by-example $ git add example_009_chmod_read_write_exec/test_read_only.log
~/projects/bash-by-example $ git add example_009_chmod_read_write_exec/test_write_only.log
error: open("example_009_chmod_read_write_exec/test_write_only.log"): Permission denied
error: unable to index file 'example_009_chmod_read_write_exec/test_write_only.log'
fatal: adding files failed
~/projects/bash-by-example $ ls -ltr example_009_chmod_read_write_exec/test_write_only.log
--w-------  1 dave  staff  19 Jul 11 05:06 example_009_chmod_read_write_exec/test_write_only.log
~/projects/bash-by-example $ ls -ltr example_009_chmod_read_write_exec/test_read_only.log 
-r--------  1 dave  staff  29 Jul 11 05:09 example_009_chmod_read_write_exec/test_read_only.log
```

## chmod by example

As per [wikipedia:chmod](https://en.wikipedia.org/wiki/Chmod)
> In Unix and Unix-like operating systems, chmod is the command and system call used to change the access permissions and the special mode flags (the setuid, setgid, and sticky flags) of file system objects (files and directories). Collectively these were originally called its modes, and the name chmod was chosen as an abbreviation of change mode
...
The chmod numerical format accepts up to four digits. The three rightmost digits define permissions for the file user, the group, and others. The optional leading digit, when 4 digits are given, specifies the special setuid, setgid, and sticky flags

I'm going to focus on the owner (i.e. no permissions at the group or other levels):
* owner write-only (200) i.e. can write but can't read
* owner read-only (200) i.e. can write but can't read


### default operations - read and write 

Normally if you create a file, the owner gets both read and write permissions
```
~/projects/bash-by-example/example_009_chmod_read_write_exec $ touch  test_read_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ ls -ltr test_read_only.log 
-rw-r--r--  1 dave  staff   0 Jul 11 05:08 test_read_only.log
```

### owner write-only (200)

In the next example, the owner of the file can write to it 
```
~/projects/bash-by-example/example_009_chmod_read_write_exec $ touch test_write_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ chmod 200 test_write_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ ls -ltr test_write_only.log
--w-------  1 dave  staff  0 Jul 11 05:05 test_write_only.log
```
but is then blocked from then even reading the file:
```
~/projects/bash-by-example/example_009_chmod_read_write_exec $ echo 'test1 - write-only' > test_write_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ cat test_write_only.log
cat: test_write_only.log: Permission denied
```

## owner read-only (400)

In the next example, the owner of the file can write to it but is then blocked from then even reading the file.

First let's setup up a file and load some data

```
~/projects/bash-by-example/example_009_chmod_read_write_exec $ touch  test_read_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ ls -ltr
total 8
--w-------  1 dave  staff  19 Jul 11 05:06 test_write_only.log
-rw-r--r--  1 dave  staff   0 Jul 11 05:08 test_read_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ echo 'test2 - read only (step one)' >  test_read_only.log
~/projects/bash-by-example/example_009_chmod_read_write_exec $ 
```

make read only
```
~/projects/bash-by-example/example_009_chmod_read_write_exec $ chmod 400 test_read_only.log 
~/projects/bash-by-example/example_009_chmod_read_write_exec $ ls -ltr test_read_only.log 
-r--------  1 dave  staff  29 Jul 11 05:09 test_read_only.log
```
 and now writes hit 'Permission denied'

```
~/projects/bash-by-example/example_009_chmod_read_write_exec $ echo 'test2 - read only (step two)' >  test_read_only.log
-bash: test_read_only.log: Permission denied
~/projects/bash-by-example/example_009_chmod_read_write_exec $ cat test_read_only.log 
test2 - read only (step one)
```
