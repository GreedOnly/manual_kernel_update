#!/bin/bash
#Fix the time
#touch /etc/profile.d/locale.sh
#echo "export LANG=en_US.UTF-8
#export LANGUAGE=en_US.UTF-8
#export LC_COLLATE=C
#export LC_CTYPE=en_US.UTF-8" > /etc/profile.d/locale.sh
#source /etc/profile.d/locale.sh
# Install kernel from scratch
yum install -y ncurses-devel gcc bc bison flex elfutils-libelf-devel openssl-devel lzma bzip2 make perl curl
curl -O https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.1.tar.xz
tar xvf linux*
cd linux-5.15.1/
cp -v /home/vagrant/.config ./
#sed -i 's/CONFIG_VIRTIO_PCI=m/CONFIG_VIRTIO_PCI=y/' .config
#sed -i 's/CONFIG_BLK_DEV_SD=m/CONFIG_BLK_DEV_SD=y/' .config
#sed -i 's/CONFIG_SCSI_VIRTIO=m/CONFIG_SCSI_VIRTIO=y/' .config
#sed -i 's/CONFIG_VIRTIO_NET=m/CONFIG_VIRTIO_NET=y/' .config
yum install -y centos-release-scl
yum install -y devtoolset-9
echo "source /opt/rh/devtoolset-9/enable" >> /etc/bashrc
source /opt/rh/devtoolset-9/enable && gcc --version | head -1
make -j4
make -j4 modules_install install
grub2-mkconfig -o /boot/grub2/grub.cfg
grub2-set-default 0
echo "Grub update done."
# Reboot VM
shutdown -r now
