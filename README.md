Otus manual-kernel-update
=======================

# What is this?
This is homework for Otus students. 
The main goal is to build a virtual machine box using Packer and publish it on the Vagrant Cloud. 
This repo has published boxes and instructions, how to build those boxes.
Boxes are available ```GreedOnly/centos-7-5```.

There are two boxes ways:
1. centos-default.json - using already prepared config to build a box with CentOS7 and install 5.15.1 Kernel from EPEL Repo + Support virtual box guest additionals.
2. centos-custom.json - build a box with CentOS7 and 5.15.1 Kernel from scratch + Support virtual box guest additionals.

## How to use it.

### Requirements

* ```Packer >= 1.7.7```
* ```Vagrant >= 2.2.10```
* ```Virtualbox >= 6.1.28``` 
 (With Guest Additionals iso)

### Clone Repo
```
git clone https://github.com/GreedOnly/manual_kernel_update.git
``` 

### Deploying published boxes:

```
cd manual_kernel_update/test && vagrant up
```
Default you've got ```centos-custom```. If you need ```centos-default```, you'll have to switch ``` config.vm.box_version = "3.0"``` to ``` config.vm.box_version = "2.0"``` in the Vagrantfile.

### This is the way how to build 

### If you want to build boxes look down:

Now, you have to choose Default or Custom:

Build Default box:
```
cd manual_kernel_update/packer && packer build centos-default.json
```

Build Custom box:

```
cd manual_kernel_update/packer && packer build centos-custom.json
```
