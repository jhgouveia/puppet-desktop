#!/bin/bash

# Run system update
sudo apt-get update
sudo apt-get dist-upgrade

# Install Puppet
sudo apt-get install puppet

# Get and run Puppet script
cd /tmp
wget https://github.com/jhgouveia/puppet-desktop/blob/master/default.pp
sudo puppet apply /tmp/default.pp
