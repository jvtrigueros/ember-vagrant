# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Ember default port
  config.vm.network "forwarded_port", guest: 4200, host: 4200

  # LiveReload default port
  config.vm.network "forwarded_port", guest: 35729, host: 35729

  config.vm.hostname = "ember-server"
  config.vm.network "public_network", ip: "192.168.0.160"

  # File Provisioning
  config.vm.provision "file", source: "smb.conf", destination: "smb.conf"

  # Shell Provisioning
  config.vm.provision "shell", path: "provision.sh"

  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    # vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    # vb.customize ["modifyvm", :id, "--memory", "2048"]
    # vb.customize ["modifyvm", :id, "--cpus", "4"]
  end
end
