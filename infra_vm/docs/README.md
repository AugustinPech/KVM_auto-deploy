# Infra & VM with KVM
## installation
### knoledge at Day 0
I already did a server deployment on a VM with virtual box. Once, 2 months ago. Without automatization.
The main source of documentation is [tecmint.com](https://www.tecmint.com/install-kvm-on-ubuntu/)
### verify the host capacity
If the output of the commd [1](CMD_history.md##verify_the_host_capacity) is higher than 0 you are good to go with the rest of the KVM installation.
Then you should install the [cpu-checker](CMD_history.md##verify_the_host_capacity) package to run further checks.
At last you should check your system with the command [kvm-ok](CMD_history.md##verify_the_host_capacity).

### installation
You run the [installation command](CMD_history.md##installation) 
You should have the libvirtd deamon running.
Run [the commands](CMD_history.md##check_libvirtd) to check if it is running.

