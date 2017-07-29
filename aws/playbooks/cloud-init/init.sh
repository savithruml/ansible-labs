#!/bin/bash

# Enable root login
sudo -u root bash << EOF
sed -i -e 's/#PermitRootLogin yes/PermitRootLogin yes/g' -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart

# Set root password
echo "root:c0ntrail123" | chpasswd

# Install Packages
yum install git epel-release vim NetworkManager -y
systemctl enable NetworkManager
yum update -y
yum install kernel-devel kernel-headers nfs-utils socat -y
reboot
