# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  node_count = 3

  (1..node_count).each do |n|
    node_name = "node#{n}"
    
    config.vm.define node_name do |node|
      node.vm.box = 'debian/buster64'
      node.vm.hostname = "rke-#{node_name}.local"
      node.vm.network :public_network

      node.vm.synced_folder ".", "/vagrant"

# If node is the first then we'll use it as our command node.
      if n == 1
        node.vm.provision :shell, path: 'rke.sh'
        node.vm.provision :shell, path: 'kubectl.sh'
      end

# All nodes get docker installed.
      node.vm.provision :shell, path: 'docker.sh'
    end
  end
end
 
