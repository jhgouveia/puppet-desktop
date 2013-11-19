package { 'sni-qt':
	ensure => present,
}

package { 'sni-qt:386':
	ensure => present,
	require => Package['sni-qt'],
}

exec { 'skype_download':
	command => 'wget -O /tmp/skype-ubuntu-lucid_4.2.0.11-1_i386.deb http://download.skype.com/linux/skype-ubuntu-lucid_4.2.0.11-1_i386.deb',
	path => '/usr/bin',
	require => Package['sni-qt:386'],
}

package { 'skype':
	source => '/tmp/skype-ubuntu-lucid_4.2.0.11-1_i386.deb',
	require => Exec['skype_download'],
}

exec { 'skype_post_install':
	command => 'sudo apt-get -f install',
	require => Package['skype'],
	path => '/usr/bin',
}

