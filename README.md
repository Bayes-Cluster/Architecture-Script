# Architecture-Script

* `adduser.sh` is for adding new user
* `quota.sh` is to allocate storage space for users
* `getport.sh` & `webcode.sh` please check [Terminal-Based Code-Server](https://github.com/Bayes-Cluster/Code-Hub/tree/main/ShellScript#terminal-based-code-server)
* `user_listen.md` is for listening users' commands

## SOP

1. Check application form
2. add user's name into `name.txt`
3. run `adduser.sh`
4. run `ldap_user.sh`
5. run `update_ldap.sh`
6. `sudo quotaoff -a`
7. `sudo quotacheck -p defaultuser -u newuser`
8. /sudo quotaopen -a
