#!/bin/bash
foo = 42
bar=007
echo $foo
current_user=`env|grep ^USER|cut -d'=' -f2`
echo $current_user
