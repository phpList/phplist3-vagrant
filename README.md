![N|s](https://www.phplist.org/wp-content/uploads/2014/04/logo-nodomain-black.svg)

#
## Install phpList using Vagrant


##### This will install phpList with LAMP stack on a Virtual-Box machine

##### Requirements :
* Vagrant
* Virtual-Box
* Ansible (only if you want to use Ansible from host machine for provisioning, the current configuration uses ansible_local and Vagrant installs Ansible on the guest machine for provisioning.)

``` sh
$ git clone https://gitlab.com/phpList/phplist3-vagrant.git
$ vagrant up
```
The first time you will bring the machine up will take some minutes as it will download the guest Operating System.

To share/sync a folder between host & guest machine uncomment the line 23 on Vagrantfile and set the desired path.

