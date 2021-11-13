#!/bin/bash

# clean all
yum update -y
yum clean all


# Install vagrant default key
mkdir -pm 700 /home/vagrant/.ssh
curl -sL https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Remove kernel modules (\/Oo\/)
rm -rf /usr/lib/modules/5.15.1/kernel/drivers/net/wireless/ #-595Mb
rm -rf /usr/lib/modules/5.15.1/kernel/drivers/gpu/ #-1Gb

# Remove temporary files
rm -rf /home/vagrant/linux-5.15.1*
rm -f /boot/*3.10*
rm -rf /tmp/*
rm  -f /var/log/wtmp /var/log/btmp
rm -rf /var/cache/* /usr/share/doc/*
rm -rf /var/cache/yum
rm -rf /vagrant/home/*.iso
rm  -f ~/.bash_history
history -c

rm -rf /run/log/journal/*

# Fill zeros all empty space
dd if=/dev/zero of=/EMPTY bs=1M | true
rm -f /EMPTY
sync
/usr/sbin/grub2-set-default 1
