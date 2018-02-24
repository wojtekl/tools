#!/bin/bash

su - administrator

sudo ufw enable
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw allow out 53
sudo ufw allow out 80/tcp
sudo ufw allow out 443/tcp
sudo ufw allow out 1935/tcp

sudo add-apt-repository ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get purge libreoffice-common
sudo apt-get install linux-generic
sudo apt-get upgrade

sudo apt-get install language-pack-gnome-pl
sudo apt-get install ttf-mscorefonts-installer
sudo apt-get install libreoffice-writer
sudo apt-get install libreoffice-calc
sudo apt-get install libreoffice-impress
sudo apt-get install libreoffice-gtk3
sudo apt-get install libreoffice-l10n-pl
sudo apt-get install myspell-pl
sudo apt-get install hyphen-pl
sudo apt-get install mythes-pl

sudo sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=2/g' /etc/default/grub
sudo sed -i 's/"quiet splash"/"modprobe.blacklist=serio_raw,lp,ppdev,parport_pc,joydev,pata_acpi vt.handoff=7 quiet splash"/g' /etc/default/grub
sudo sed -i 's/#GRUB_GFXMODE=640x480/#GRUB_GFXMODE=640x480\nGRUB_GFXPAYLOAD_LINUX=1280x720/g' /etc/default/grub
sudo update-grub

sudo sed -i 's/errors=remount-ro/errors=remount-ro,relatime/g' /etc/fstab

sudo sed -i 's/^exit 0/echo US15 | sudo tee \/proc\/acpi\/wakeup\n\nexit 0/' /etc/rc.local

sudo nvidia-xconfig --no-logo


# instalacja oprogramowania jako root
# gksu -w -u `getent group sudo | awk -F: '{print $NF}'` gksudo mintinstall

# super hybrid engine
# echo "0" | sudo tee cat /sys/devices/platform/eeepc-wmi/cpufv

# firefox popups
# about:config -> browser.link.open_newwindow.restriction 0

