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

## first VM
### with virt-manager
run the cmd `virt-manager`

select the ISO image (here Debian12)

### from CMD line
the command to create a VM is : 
```bash
sudo virt-install --name=deepin-vm --os-variant=Debian10 --vcpu=2 --ram=2048 --graphics spice --location=/home/Downloads/deepin-20Beta-desktop-amd64.iso --network bridge:vibr0
```

the options `--name=` and `--os-variant=` are respectively the name and of the VM.

the option `--location=` is the localization of the iso file


### debian installation
1. select language : English (default)
2. select your location :
    * 3 down for other
    * 2 up for Europe
    * 16 down for France
    * demerdenziz ich
3. configure the keyboard
    *  18 down for French
4. select host-name
5. select root passWord
    * confirm password
6. select root name
7. select user name
8. select user password
9. partition disk
    * one down for "Guided - use entire disk and set up lvm"
    * choose disk
    * "all files in one partition" (default)
10. validate ("Yes")
11. configure LVM
    * choose the volume of irst partition (default = total)
    * forward
    * (yes)
12. scan extra installation media : No (default)
13. configure the package manager :
    * choose the country : France (default)
    * archive mirror : deb.debian.org (default)
    * HTTP proxy blank (default)
    * participate to popularity contest ? no (default)
    * choose defult packages : the tow last options
    * configuring the grub-pc : yes (default)
    * default loader drive : secound choice
14. continue to reboot

### first thing first
#### install sudo
[install sudo](CMD_history.md##install_sudo)
#### install SSH
[install SSH](CMD_history.md##install_SSH)
change the port in the config file

## configure a server
### install apache
[install apache](CMD_history.md##install_apache)
### install php
[install php](CMD_history.md##install_php)
### install mysql
[install mysql](CMD_history.md##install_mysql)
