#!/bin/bash
mkdir /media/cdrom
#mount VBoxGuestAdditions.iso  /media/cdrom/
mount /dev/sr1 /media/cdrom/
/bin/bash /media/cdrom/VBoxLinuxAdditions.run --nox11
