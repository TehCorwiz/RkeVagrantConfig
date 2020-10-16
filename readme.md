*This is my personal config for setting up a Rancher playground locally.*

Features:

- Based on Debian 10 (Buster)
- Configurable number of nodes (default: 3)
- First node has `rke` amd `kubectl` installed, serves as a 'command' node so tools don't need to be installed on host.

Future:

- Might switch to CentOS to better match other environments I work with.
- Static IPs for easier Rancher config.

