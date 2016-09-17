#!/bin/bash
#
# Perform final, changes to the Vagrant box.
#

# Change default editor to Vi (Nano is for pussies)
eselect editor set /usr/bin/vi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add git autocompletion and branch name to prompt
# This depends on having bash-completion being already installed.
cat ${DIR}/service-configs/bashrc.root.append >> ~/.bashrc
cat ${DIR}/service-configs/bashrc.vagrant.append >> /home/vagrant/.bashrc

# Enable git bash completion.
source /etc/bash/bashrc.d/bash_completion.sh 
# I want this next line to work, but it doesn't.  The "true" is to prevent the error stopping the script.
eselect bashcomp enable --global git || true

cat ${DIR}/service-configs/bash_profile.append >> ~/.bash_profile
cat ${DIR}/service-configs/bash_profile.append >> /home/vagrant/.bash_profile

# Correct permissions on bash files produced by the previous commands.
chmod 600 /home/vagrant/.bash_profile
chown vagrant:vagrant /home/vagrant/.bash_profile
chmod 600 /home/vagrant/.bashrc
chown vagrant:vagrant /home/vagrant/.bashrc
