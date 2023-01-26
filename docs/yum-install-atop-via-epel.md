## yum install atop via epel


Problem 
* `yum install -y atop`
* `No package atop available.`

```
[root@c7-master ~]# yum install -y atop
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.airenetworks.es
 * extras: mirror.airenetworks.es
 * updates: mirror.airenetworks.es
base                                                                                                                                     | 3.6 kB  00:00:00
docker-ce-stable                                                                                                                         | 3.5 kB  00:00:00
extras                                                                                                                                   | 2.9 kB  00:00:00
hashicorp                                                                                                                                | 1.4 kB  00:00:00
updates                                                                                                                                  | 2.9 kB  00:00:00
(1/2): docker-ce-stable/7/x86_64/primary_db                                                                                              |  93 kB  00:00:00
(2/2): hashicorp/7/x86_64/primary                                                                                                        | 141 kB  00:00:00
hashicorp                                                                                                                                             1012/1012
No package atop available.
Error: Nothing to do
```

Fix 
* `yum install -y epel-release`
* `yum install -y atop`

```
[root@c7-master ~]# yum install -y epel-release
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.airenetworks.es
 * extras: mirror.airenetworks.es
 * updates: mirror.airenetworks.es
Resolving Dependencies
--> Running transaction check
---> Package epel-release.noarch 0:7-11 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================================================================================================
 Package                                    Arch                                 Version                             Repository                            Size
================================================================================================================================================================
Installing:
 epel-release                               noarch                               7-11                                extras                                15 k

Transaction Summary
================================================================================================================================================================
Install  1 Package

Total download size: 15 k
Installed size: 24 k
Downloading packages:
epel-release-7-11.noarch.rpm                                                                                                             |  15 kB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : epel-release-7-11.noarch                                                                                                                     1/1
  Verifying  : epel-release-7-11.noarch                                                                                                                     1/1

Installed:
  epel-release.noarch 0:7-11

Complete!
[root@c7-master ~]# yum install -y atop
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
epel/x86_64/metalink                                                                                                                     |  21 kB  00:00:00
 * base: mirror.airenetworks.es
 * epel: it1.mirror.vhosting-it.com
 * extras: mirror.airenetworks.es
 * updates: mirror.airenetworks.es
epel                                                                                                                                     | 4.7 kB  00:00:00
(1/3): epel/x86_64/group_gz                                                                                                              |  99 kB  00:00:00
(2/3): epel/x86_64/updateinfo                                                                                                            | 1.0 MB  00:00:00
(3/3): epel/x86_64/primary_db                                                                                                            | 7.0 MB  00:00:00
Resolving Dependencies
--> Running transaction check
---> Package atop.x86_64 0:2.7.1-1.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================================================================================================
 Package                             Arch                                  Version                                    Repository                           Size
================================================================================================================================================================
Installing:
 atop                                x86_64                                2.7.1-1.el7                                epel                                175 k

Transaction Summary
================================================================================================================================================================
Install  1 Package

Total download size: 175 k
Installed size: 386 k
Downloading packages:
warning: /var/cache/yum/x86_64/7/epel/packages/atop-2.7.1-1.el7.x86_64.rpm: Header V4 RSA/SHA256 Signature, key ID 352c64e5: NOKEY
Public key for atop-2.7.1-1.el7.x86_64.rpm is not installed
atop-2.7.1-1.el7.x86_64.rpm                                                                                                              | 175 kB  00:00:00
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Importing GPG key 0x352C64E5:
 Userid     : "Fedora EPEL (7) <epel@fedoraproject.org>"
 Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5
 Package    : epel-release-7-11.noarch (@extras)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : atop-2.7.1-1.el7.x86_64                                                                                                                      1/1
  Verifying  : atop-2.7.1-1.el7.x86_64                                                                                                                      1/1

Installed:
  atop.x86_64 0:2.7.1-1.el7

Complete!
[root@c7-master ~]#
```
