# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  node_count = 3

  (1..node_count).each do |n|
    node_name = "node#{n}"
    
    config.vm.define node_name do |node|
      node.vm.box = 'debian/buster64'
      node.vm.hostname = "rke-#{node_name}.local"
      ip_frag = 200 + n
      node.vm.network "private_network", ip: "10.2.2.#{ip_frag}"

      node.vm.synced_folder "./cluster", "/vagrant"

# This shares your Vagrant `insecure_private_key` between the node VMs.
# This is my shortcut solution to configuring SSH-ing between VMs.
# There are more correct and more robust solutions, but they're also more complex.
# If it wasn't obvious DON'T DO THIS IN PRODUCTION!
      node.vm.provision "shell" do |s|
        ssh_insecure_key = File.read("#{Dir.home}/.vagrant.d/insecure_private_key")
        s.inline = <<-SHELL
          echo "#{ssh_insecure_key}" >> /home/vagrant/.ssh/id_rsa
          chown vagrant /home/vagrant/.ssh/id_rsa
          chmod 400 /home/vagrant/.ssh/id_rsa
          ssh-keygen -y -f /home/vagrant/.ssh/id_rsa > /home/vagrant/.ssh/id_rsa.pub
          cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
        SHELL
      end

# If node is the first then we'll use it as our command node.
      if n == 1
        node.vm.provision :shell, path: 'install/rke.sh'
        node.vm.provision :shell, path: 'install/kubectl.sh'
      end

# All nodes get docker installed.
      node.vm.provision :shell, path: 'install/docker.sh'
    end
  end
end
