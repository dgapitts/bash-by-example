## atop extra config


add to automatical restart on boot
```
[root@c7-master ~]# systemctl enable atop
Created symlink from /etc/systemd/system/multi-user.target.wants/atop.service to /usr/lib/systemd/system/atop.service.
[root@c7-master ~]# systemctl enable status
Failed to execute operation: No such file or directory
[root@c7-master ~]# systemctl status atop
● atop.service - Atop advanced performance monitor
   Loaded: loaded (/usr/lib/systemd/system/atop.service; enabled; vendor preset: disabled)
   Active: inactive (dead)
     Docs: man:atop(1)
```

update config `LOGINTERVAL=60`

```
[root@c7-master ~]# cp /etc/default/atop /etc/default/atop.orig
cp: cannot stat '/etc/default/atop': No such file or directory
[root@c7-master ~]# cp /etc/sysconfig/atop /etc/sysconfig/atop.orig
[root@c7-master ~]# vi /etc/sysconfig/atop
[root@c7-master ~]# diff /etc/sysconfig/atop /etc/sysconfig/atop.orig
2c2
< LOGINTERVAL=60
---
> LOGINTERVAL=600
```

restart 
```
[root@c7-master ~]# systemctl restart atop.service
[root@c7-master ~]# systemctl status atop.service
● atop.service - Atop advanced performance monitor
   Loaded: loaded (/usr/lib/systemd/system/atop.service; enabled; vendor preset: disabled)
   Active: active (running) since Sat 2023-01-28 22:26:19 UTC; 10s ago
     Docs: man:atop(1)
  Process: 12615 ExecStartPost=/usr/bin/find ${LOGPATH} -name atop_* -mtime +${LOGGENERATIONS} -exec rm -v {} ; (code=exited, status=0/SUCCESS)
  Process: 12612 ExecStartPre=/bin/sh -c test -n "$LOGGENERATIONS" -a "$LOGGENERATIONS" -eq "$LOGGENERATIONS" (code=exited, status=0/SUCCESS)
  Process: 12610 ExecStartPre=/bin/sh -c test -n "$LOGINTERVAL" -a "$LOGINTERVAL" -eq "$LOGINTERVAL" (code=exited, status=0/SUCCESS)
 Main PID: 12614 (atop)
    Tasks: 1
   Memory: 4.6M
   CGroup: /system.slice/atop.service
           └─12614 /usr/bin/atop -w /var/log/atop/atop_20230128 60

Jan 28 22:26:19 c7-master systemd[1]: Starting Atop advanced performance monitor...
Jan 28 22:26:19 c7-master systemd[1]: Started Atop advanced performance monitor.
```

and monitor a bit 

```
[root@c7-master ~]# for i in {1..10};do uptime;ls -l /var/log/atop/atop_20230128;sleep 60;done
 22:27:30 up 10 days, 23:28,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 13885 Jan 28 22:27 /var/log/atop/atop_20230128
 22:28:30 up 10 days, 23:29,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 24375 Jan 28 22:28 /var/log/atop/atop_20230128
 22:29:30 up 10 days, 23:30,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 30187 Jan 28 22:29 /var/log/atop/atop_20230128
 22:30:30 up 10 days, 23:31,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 36029 Jan 28 22:30 /var/log/atop/atop_20230128
 22:31:30 up 10 days, 23:32,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 41861 Jan 28 22:31 /var/log/atop/atop_20230128
 22:32:30 up 10 days, 23:33,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 47685 Jan 28 22:32 /var/log/atop/atop_20230128
 22:33:30 up 10 days, 23:34,  1 user,  load average: 0.00, 0.01, 0.05
-rw-r--r--. 1 root root 53513 Jan 28 22:33 /var/log/atop/atop_20230128
 22:34:30 up 10 days, 23:35,  1 user,  load average: 0.04, 0.03, 0.05
-rw-r--r--. 1 root root 59374 Jan 28 22:34 /var/log/atop/atop_20230128
 22:35:30 up 10 days, 23:36,  1 user,  load average: 0.02, 0.02, 0.05
-rw-r--r--. 1 root root 65221 Jan 28 22:35 /var/log/atop/atop_20230128
```

