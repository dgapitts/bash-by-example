### Setup

For RHEL/Centos:

```
  # Add ShellCheck https://github.com/koalaman/shellcheck - a great tool for testing and improving the quality of shell scripts
  yum -y install epel-release
  yum -y install ShellCheck
```

### Simple example

Here is my demo problematic script:

```
[pg12centos7:vagrant:~/bash-by-example/example_006_introducing_ShellCheck] # cat myscript 
#!/bin/bash
foo = 42
bar=007
echo $foo
```

and running shellcheck
```
[pg12centos7:vagrant:~/bash-by-example/example_006_introducing_ShellCheck] # shellcheck myscript 

In myscript line 2:
foo = 42
    ^-- SC1068: Don't put spaces around the = in assignments.


In myscript line 3:
bar=007
^-- SC2034: bar appears unused. Verify it or export it.
```

You can also test this online https://www.shellcheck.net/

