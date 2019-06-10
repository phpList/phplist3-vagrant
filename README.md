
<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/phpList/phplist3-vagrant">
    <img src="https://www.phplist.org/wp-content/uploads/2014/04/logo-nodomain-black.svg" alt="Logo" width="220" height="80">
  </a>
</p>


#
## Run phpList using Vagrant


Run phpList on Debian 9 (stretch) with Apache, MariaDB & PHP 7

### Requirements :
* Vagrant
* Virtual-Box

### Steps :
``` sh
$ git clone https://github.com/phpList/phplist3-vagrant.git
$ cd phplist3-vagrant
$ vagrant up
```
Your phpList installation can be reached on http://127.0.0.1:8086/lists/admin

*To share/sync a folder between your PC and the Virtual Machine uncomment the line 23 on Vagrantfile and set the desired path, this way you can edit files without the need to enter on the virtual machine. 
Example:*

``` sh
config.vm.synced_folder "/home/user/Documents/sharedfolder", "/var/www/phplist/installation/"
```

*Note: The first time you will bring the machine up will take some minutes as it will download the guest Operating System.*



### Install phpList using Ansible
Inside the "provision" directory, can be found the playbook for installing phpList with Ansible.

*Note: The phplist-additions.sh script should be copied too.*
