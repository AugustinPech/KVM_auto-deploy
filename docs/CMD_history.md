## verify_the_host_capacity
```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
sudo apt install cpu-checker
sudo kvm-ok
```
## installation
```bash
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
```
## check_libvirtd
```bash
sudo systemctl status libvirtd
sudo systemctl enable --now libvirtd
lsmod | grep -i kvm
```
## first_steps
```bash
# start virt manager
virt-manager
# create new VM
sudo virt-install --name=VMtest --os-variant=debian12 --vcpu=2 --ram=2048 --graphics spice --location=/home/augustin/Downloads/debian-12.5.0-amd64-netinst.iso --network bridge:virbr0 
```

## install_sudo
```bash
su root
apt-get install sudo
```

## install_apache2
```bash
su root
apt-get install apache2
su root -l
vi /etc/group
# modifier la ligne sudo: pour ajouter votre utilisateur
exit
# log in again
```

## install_php
```bash
apt install php-fpm
systemctl restart apache2
```

## install_mysql
```bash
sudo apt install wget -y
sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb
sudo apt install ./mysql-apt-config_*_all.deb
```

## install_SSH
```bash
# on server
sudo apt install openssh-server
hostname -I
sudo vi /etc/ssh/sshd_config
sudo systemctl restart ssh

# client
ssh-copy-id -i ~/.ssh/id_dsa augustin@192.168.122.79
ssh -p <port> username@ipv4
```