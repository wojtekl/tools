#!/bin/bash

su - administrator

sudo ufw enable
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw allow out 53
sudo ufw allow out 80/tcp
sudo ufw allow out 443/tcp
sudo ufw allow out 1935/tcp

sudo apt-get purge nemo-dropbox
sudo apt-get purge python-appindicator
sudo apt-get purge python-gpgme

sudo add-apt-repository ppa:libreoffice/ppa

sudo apt-get update
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get upgrade

sudo apt-get install xfce4-clipman
sudo apt-get install ttf-mscorefonts-installer
sudo apt-get install libreoffice-writer
sudo apt-get install libreoffice-calc
sudo apt-get install libreoffice-impress
sudo apt-get install libreoffice-gtk3
sudo apt-get install libreoffice-l10n-pl
sudo apt-get install myspell-pl
sudo apt-get install hyphen-pl
sudo apt-get install mythes-pl

sudo sed -i 's/"quiet splash"/"modprobe.blacklist=serio_raw,lp,ppdev,parport_pc,joydev,pata_acpi quiet splash"/g' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=3/g' /etc/default/grub
sudo update-grub

sudo sed -i 's/errors=remount-ro/errors=remount-ro,relatime/g' /etc/fstab

sudo sed -i 's/^exit 0/echo US15 | sudo tee \/proc\/acpi\/wakeup\n\nexit 0/' /etc/rc.local

sed -i '1i"synclient TouchpadOff=$(synclient -l | grep -c\n\x27TouchpadOff.*=.*0\x27)"\n    XF86TouchpadToggle\n' .config/peppermint-control-center/xbindkeys.conf


# instalacja oprogramowania jako root
# gksu -w -u `getent group sudo | awk -F: '{print $NF}'` gksudo mintinstall

# super hybrid engine
# echo "0" | sudo tee cat /sys/devices/platform/eeepc-wmi/cpufv

