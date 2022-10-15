#!/bin/bash

basepath=$(cd `dirname $*`; pwd)
cat $basepath/$1 | while read line

do
    sudo quotaoff -a     #off the quota service
    echo "Allocate disk quota to these new user"
    echo "The user name is: ${line}"
    sudo edquota -p test -u ${line} # copy the configuration from test to ${line}
    sudo quotaon -p  /Storage2030005001_0 | grep  "on"

    if [ $? -ne 0 ] ;then
            echo "NOT OK"
    else
            echo "OK"
    fi


done
echo "Finish Allocation"
