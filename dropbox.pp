exec { 'apt_get_update':
        command => 'sudo apt-get update',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
}

exec { 'apt_get_dist-upgrade':
        command => 'sudo apt-get dist-upgrade',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Exec['apt_get_update'],
}

exec { 'dropbox_download':
	command => 'wget -O /tmp/dropbox_1.6.0_amd64.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb',
	require => Exec['apt_get_dist-upgrade'], 
	path => '/usr/bin',
}

exec { 'dropbox_install':
	command => 'sudo dpkg -i /tmp/dropbox_1.6.0_amd64.deb',
	require => Exec['dropbox_download'],
	path => '/usr/bin',
}



/*

# package example
package {'':
	ensure => present,
	require => Package[''],
}

*/
