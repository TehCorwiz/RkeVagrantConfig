**This is my personal config for setting up a Rancher playground locally.**

Features:

- Based on Debian 10 (Buster) 64-bit
- Configurable number of nodes (default: 3)
- First node has `rke` amd `kubectl` installed, serves as a 'command' node so tools don't need to be installed on host.

Future:

- Might switch to CentOS to better match other environments I work with.
- Static IPs for easier Rancher config.

Requirements:

- Vagrant
- VirtualBox

**Usage** (all nodes):

Node IPs are in the 10.2.2.* block starting at 10.2.2.201.

- Edit `Vagrantfile` to set number of nodes.
- `vagrant up` to start and provision nodes.
- `vagrant ssh node1` to get a shell in the 'command' node.
- The project path is mounted at `/vagrant` inside the VMs.
  - `cd /vagrant`
- `rke up`
- `vagrant suspend` to shut down nodes.
- `vagrant destroy` to tear down nodes.
