### Summmary

I sometime find it useful to add custom functions to my .bash_profile:
* these functions represent common operations which I frequently run e.g. custom_search
* these functions can take arguements (unlike a simple alias)
* the long names initially look painful to type BUT tab completion means these functions are quick to run and it is makes it pretty obvious this is something custom I've setup
```
search_grep_count_caseinsentive_currdir-recursive() { time grep -r -i -c $1 *|grep -v '\:0$'; }
search_grep_caseinsentive_currdir-recursive() { time grep -r -i $1 *; }
``` 
I do also use these sort of functions for more specific functions, this approach is very flexible




### Simple examples of add functions to .bash_profile

The search_grep_count_caseinsentive_currdir-recursive does what the name implies and takes one arguement
i.e. $1:

```
[~/projects] # tail -1 ~/.bash_profile 
search_grep_count_caseinsentive_currdir-recursive() { time grep -r -i -c $1 *|grep -v '\:0$'; }
[~/projects] # . ~/.bash_profile 
[~/projects] # search_grep_count_caseinsentive_currdir-recursive docker
local-cockroachdb/cockroach-v20.2.7.linux-amd64/cockroach:2
puppet-control-repo/Puppetfile:2
puppet-control-repo/README.md:19
puppet-control-repo/.git/logs/HEAD:1
puppet-control-repo/.git/logs/refs/heads/production:1
puppet-control-repo/site/profile/manifests/agent_nodes.pp:3
vagrant-ansible-for-devops/Vagrantfile:1
vagrant-centos7-statsd/README.md:6
vagrant-centos7-statsd/provision.sh:1
vagrant-puppet/README.md:1

real	0m24.325s
user	0m15.212s
sys	0m1.716s
```

similarly `search_grep_caseinsentive_currdir-recursive` works very similarly and allows us to see actual details and not just counts
 

```
[~/projects] # search_grep_caseinsentive_currdir-recursive docker
...
vagrant-ansible-for-devops/Vagrantfile:  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
vagrant-centos7-statsd/README.md:## Switching to docker
vagrant-centos7-statsd/README.md:yum -y install docker
vagrant-centos7-statsd/README.md:systemctl start docker.service 
vagrant-centos7-statsd/README.md:systemctl status docker.service 
vagrant-centos7-statsd/README.md:docker images
vagrant-centos7-statsd/README.md:docker run -id -p 8000:8000 -p 3000:3000 -p 8125:8125/udp kamon/grafana_graphite
vagrant-centos7-statsd/provision.sh:  yum -y install docker     
vagrant-puppet/README.md:This repo can be used in conjunction with this training exercise to deploy postgres docker containers via puppet https://github.com/dgapitts/puppet-control-repo

real	0m17.577s
user	0m13.504s
sys	0m1.420s
```