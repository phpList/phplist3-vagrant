![N|s](https://www.phplist.org/wp-content/uploads/2014/04/logo-nodomain-black.svg)

#
## Install phpList using Vagrant


##### Install phpList on Debian 9 (stretch), alongside Apache, MariaDB & PHP-7

##### Requirements :
* Vagrant
* Virtual-Box

##### Steps :
``` sh
$ git clone https://github.com/phpList/phplist3-vagrant.git
$ cd phplist3-vagrant
$ vagrant up
```
*Note: The first time you will bring the machine up will take some minutes as it will download the guest Operating System.*

To share/sync a folder between host & guest machine uncomment the line 23 on Vagrantfile and set the desired path.

##### Install phpList using Ansible
Inside the "provision" directory, can be found the playbook for installing phpList with Ansible.

*Note: The phplist-additions.sh script should be copied too.*
