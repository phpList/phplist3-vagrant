# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  config.vm.network "forwarded_port", guest: 80, host: 8086


  config.vm.provider "virtualbox" do |v|
    v.name = "phplist-lamp-stack"
    v.memory = 512
    v.cpus = 1
    v.linked_clone = true
    v.gui = false
  end

# The option config.vm.synced_folder with sync two folders between host and guest machine, uncomment to enable.

#  config.vm.synced_folder "/path/to/folder/hostmachine", "/path/to/folder/guestmachine"

  ####### Provision #######

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/playbook.yml"
    ansible.install_mode = "pip"
    ansible.version = "2.2.1.0"
    ansible.verbose = true

  end
  
  config.vm.provision "shell", privileged: false, inline: <<-EOF
  echo "Your phpList installation is finished"
  echo "By default the phpList installation can be reached at http://127.0.0.1:8086/lists/admin"
  EOF


end
