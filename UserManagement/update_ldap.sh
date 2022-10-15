ldapadd -x -c -W -D "cn=admin,dc=default,dc=com" -f ldapuser.ldif
ldapmodify -D "cn=admin,dc=default,dc=com"  -w secrete -x -a -f ldapuser.ldif
