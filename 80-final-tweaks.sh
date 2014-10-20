#!/bin/bash
#
# Perform final, changes to the Vagrant box.
#

# Change default editor to Vi (Nano is for pussies)
eselect editor set /usr/bin/vi

# Add git autocompletion and branch name to prompt
# This depends on having bash-completion being already installed.
cat /vagrant/service-configs/bashrc.root.append >> ~/.bashrc
cat /vagrant/service-configs/bashrc.vagrant.append >> /home/vagrant/.bashrc

# Enable git bash completion.
source /etc/profile.d/bash-completion.sh
eselect bashcomp enable --global git

cat /vagrant/service-configs/bash_profile.append >> ~/.bash_profile
cat /vagrant/service-configs/bash_profile.append >> /home/vagrant/.bash_profile

# Correct permissions on bash files produced by the previous commands.
chmod 600 /home/vagrant/.bash_profile
chown vagrant:vagrant /home/vagrant/.bash_profile
chmod 600 /home/vagrant/.bashrc
chown vagrant:vagrant /home/vagrant/.bashrc