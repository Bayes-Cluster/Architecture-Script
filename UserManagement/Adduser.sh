#!/bin/bash

basepath=$(cd `dirname $0`; pwd)
cat $basepath/name.txt | while read line

#eampty the user.txt
#echo /dev/null > echo basepath/user.txt

do
echo "The user name is : ${line}"
echo
echo
echo "Now we add ${line} into user"
#sleep 2
password=`echo $(date +%s%n)$RANDOM|md5sum |cut -c 2-9`


echo
echo -e "user: \t${line} passwd:$password" >> $basepath/user.txt
echo "The users password is $password"
echo
echo
#chage -d 0 ${line}
# new a storage dir // The Storage dir need to be changed manually
mkdir /Storage2030005000/home/${line}
# set permiision of user's home and storage dir
#chown -R ${line}.${line} /Storage2030005001_0/${line}
cp -r /etc/skel/* /Storage2030005000/home/${line}/
cp -r /etc/skel/. /Storage2030005000/home/${line}/
sleep 2

sudo adduser --home /Storage2030005000/home/${line} "${line}" << ENDX
$password
$password
First Last

Y
ENDX
chown -R ${line}.${line} /Storage2030005000/home/${line}
chmod 0700 /Storage2030005000/home/${line}
done

exit 0
