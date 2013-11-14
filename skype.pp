/*
exec { 'apt_get_update':
        command => 'sudo apt-get update',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
}

exec { 'apt_get_dist-upgrade':
        command => 'sudo apt-get dist-upgrade',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Exec['apt_get_update'],
}
*/

exec { 'skype_download':
	command => 'wget -O /tmp/skype-ubuntu-lucid_4.2.0.11-1_i386.deb http://download.skype.com/linux/skype-ubuntu-lucid_4.2.0.11-1_i386.deb',
	path => '/usr/bin',
}

exec { 'skype_install':
	command => 'sudo dpkg -i /tmp/skype-ubuntu-lucid_4.2.0.11-1_i386.deb',
	require => Exec['skype_download'],
	path => '/usr/bin',
}

exec { 'skype_post_install':
	command => 'sudo apt-get -f install',
	require => Exec['skype_install'],
	path => '/usr/bin',
}

/*

# package example
package {'':
	ensure => present,
	require => Package[''],
}

*/
