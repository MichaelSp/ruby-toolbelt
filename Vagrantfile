# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 4
  end
  config.vm.provision "shell", inline: <<-SHELL
     sudo apt-add-repository ppa:brightbox/ruby-ng
     sudo apt-get update
     sudo apt-get install -y ruby2.2 ruby2.2-dev libffi-dev  libsqlite3-dev zlib1g-dev build-essential nodejs
  SHELL

end
