### Simple install as part of postgresql

```
[root@c7-master ~]# yum install -y postgresql
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.airenetworks.es
 * epel: mirror.netcologne.de
 * extras: mirror.airenetworks.es
 * updates: mirror.airenetworks.es
Resolving Dependencies
--> Running transaction check
---> Package postgresql.x86_64 0:9.2.24-8.el7_9 will be installed
--> Processing Dependency: postgresql-libs(x86-64) = 9.2.24-8.el7_9 for package: postgresql-9.2.24-8.el7_9.x86_64
--> Processing Dependency: libpq.so.5()(64bit) for package: postgresql-9.2.24-8.el7_9.x86_64
--> Running transaction check
---> Package postgresql-libs.x86_64 0:9.2.24-8.el7_9 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================================================================================================
 Package                                   Arch                             Version                                     Repository                         Size
================================================================================================================================================================
Installing:
 postgresql                                x86_64                           9.2.24-8.el7_9                              updates                           3.0 M
Installing for dependencies:
 postgresql-libs                           x86_64                           9.2.24-8.el7_9                              updates                           235 k

Transaction Summary
================================================================================================================================================================
Install  1 Package (+1 Dependent package)

Total download size: 3.3 M
Installed size: 17 M
Downloading packages:
(1/2): postgresql-libs-9.2.24-8.el7_9.x86_64.rpm                                                                                         | 235 kB  00:00:00
(2/2): postgresql-9.2.24-8.el7_9.x86_64.rpm                                                                                              | 3.0 MB  00:00:00
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                           6.5 MB/s | 3.3 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : postgresql-libs-9.2.24-8.el7_9.x86_64                                                                                                        1/2
  Installing : postgresql-9.2.24-8.el7_9.x86_64
 ...
 ``` 