# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.ssh.forward_agent = true

  config.vm.provision "shell", inline: "apt-get update -qq"
  config.vm.provision "shell", inline: "wget http://jp.archive.ubuntu.com/ubuntu/pool/universe/g/gauche/libgauche-0.9-0_0.9.4-5_amd64.deb"
  config.vm.provision "shell", inline: "wget http://jp.archive.ubuntu.com/ubuntu/pool/universe/g/gauche/gauche_0.9.4-5_amd64.deb"
  config.vm.provision "shell", inline: "dpkg -i libgauche-0.9-0_0.9.4-5_amd64.deb"
  config.vm.provision "shell", inline: "dpkg -i gauche_0.9.4-5_amd64.deb"
end
