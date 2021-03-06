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
- `cd /vagrant`
  - The `./cluster` folder which contains the `cluster.yml` and related files is mounted at `/vagrant` inside the VMs.
- `rke up`
  - Afterwards I suggest exiting the VM and creating a snapshot through vagrant to make things easier if you need to backup.
  - `vagrant snapshot save "after-rke"`
- `vagrant suspend` to put nodes to sleep.
- `vagrant resume` to wake them back up.
- `vagrant destroy` to tear down nodes.
