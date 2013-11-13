#!/bin/bash


# test for sudo
if [ `whoami` != root ];
then
	#Run system update
	sudo apt-get update
	sudo apt-get dist-upgrade

	#Install Puppet
	sudo apt-get install puppet

	cd /tmp
	wget https://github.com/jhgouveia/puppet-desktop/blob/master/default.pp
	sudo puppet apply /tmp/default.pp

else
        echo "Por favor, execute este script utilizando SUDO";
fi
