## Demo


`shellcheck` is a great tool for tightening up your shell scripts

Below I give a quick demo of how to setup and use `shellcheck`, plus some examples of the following errors

* SC1068: Don't put spaces around the = in assignments.
* SC2034: bar appears unused. Verify it or export it.
* SC2006: Use $(..) instead of legacy `..`.
* SC2086: Double quote to prevent globbing and word splitting.



### Setup - rpm package(s)

For RHEL/Centos:

```
  # Add ShellCheck https://github.com/koalaman/shellcheck - a great tool for testing and improving the quality of shell scripts
  yum -y install epel-release
  yum -y install ShellCheck
```



### Start 

```
[pg13-db1:root:~/ShellCheck] # cat demo-start.sh
#!/bin/bash
foo = 42
bar=007
echo $foo
current_user=`env|grep ^USER|cut -d'=' -f2`
echo $current_user
```

and

```
[pg13-db1:root:~/ShellCheck] # shellcheck demo-start.sh

In demo-start.sh line 2:
#!/bin/bash
foo = 42
    ^-- SC1068: Don't put spaces around the = in assignments.


In demo-start.sh line 3:
bar=007
^-- SC2034: bar appears unused. Verify it or export it.


In demo-start.sh line 5:
current_user=`env|grep ^USER|cut -d'=' -f2`
             ^-- SC2006: Use $(..) instead of legacy `..`.


In demo-start.sh line 6:
echo $current_user
     ^-- SC2086: Double quote to prevent globbing and word splitting.
```



### Finish

```
[pg13-db1:root:~/ShellCheck] # cat demo-finish.sh
#!/bin/bash
foo=42
echo $foo
current_user=$(env|grep ^USER|cut -d'=' -f2)
echo "${current_user}"
[pg13-db1:root:~/ShellCheck] # shellcheck demo-finish.sh
[pg13-db1:root:~/ShellCheck] #
```

and 

```
~/projects/bash-by-example/example_006_introducing_ShellCheck $ env|grep ^USER|cut -d'=' -f2
dave
```