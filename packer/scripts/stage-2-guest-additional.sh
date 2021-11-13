#!/bin/bash
mkdir /media/cdrom
mount /dev/sr1 /media/cdrom/

yum install -y centos-release-scl
yum install -y bzip2 gcc make perl
yum install -y https://mirror.rackspace.com/elrepo/kernel/el7/x86_64/RPMS/kernel-ml-devel-5.15.1-1.el7.elrepo.x86_64.rpm
yum install -y devtoolset-9
echo "source /opt/rh/devtoolset-9/enable" >> /etc/bashrc
source /opt/rh/devtoolset-9/enable && gcc --version | head -1
/bin/bash /media/cdrom/VBoxLinuxAdditions.run --nox11

# Reboot VM
shutdown -r now