exec { 'apt_upgrade':
        command => 'sudo apt-get dist-upgrade',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
}

exec { 'dropbox_download':
	command => 'wget -O /tmp/dropbox_1.6.0_amd64.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb',
	require => Exec['apt_upgrade'], 
	path => '/usr/bin',
}

package { 'dropbox':
	source => '/tmp/dropbox_1.6.0_amd64.deb',
	require => Exec['dropbox_download'],
}

