# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "wheezy_min"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = ".vagrant/provision/puppet/manifests"
  end

  config.vm.define "backend", primary: true do |node|
    node.vm.hostname = "backend"
    node.vm.network :forwarded_port, guest: 9393, host: 8080
    #node.vm.network :private_network, ip: "192.168.206.2"
  end

end
