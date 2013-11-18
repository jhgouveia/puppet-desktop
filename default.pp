exec { 'apt_update':
        command => 'sudo apt-get update',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
}

exec { 'apt_upgrade':
        command => 'sudo apt-get dist-upgrade',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Exec['apt_update'],
}

package {'likewise-open':
        ensure => present,
        require => Exec['apt_upgrade'], 
}

package {'vim':
        ensure => present,
        require => Package['likewise-open'], 
}

package {'cifs-utils':
	ensure => present,
	require => Package['vim'],
}

package {'alacarte':
	ensure => present,
	require => Package['cifs-utils'],
}

package {'pidgin':
	ensure => present,
	require => Package['alacarte'],
}

package {'openjdk-7-jre':
	ensure => present,
	require => Package['pidgin'],
}

package {'icedtea-7-plugin':
	ensure => present,
	require => Package['openjdk-7-jre'],
}

package {'ubuntu-restricted-extras':
	ensure => present,
	require => Package['icedtea-7-plugin'],
}

package {'filezilla':
	ensure => present,
	require => Package['ubuntu-restricted-extras'],
}

package {'mysql-workbench':
	ensure => present,
	require => Package['filezilla'],
}

package {'keepass2':
	ensure => present,
	require => Package['mysql-workbench'],
}

package {'git':
	ensure => present,
	require => Package['keepass2'],
}

package {'flashplugin-installer':
	ensure => present,
	require => Package['git'],
}

package { 'python-gpgme':
	ensure => present,
}

package { 'vim-puppet':
	ensure => present,
	require => Exec['apt_update'],
}

package { 'libappindicator1':
	ensure => present,
	require => Package['vim-puppet'],
}

package { 'vlc':
        ensure => present,
        require => Exec['apt_upgrade'],
}

package { 'xclip':
        ensure => present,
        require => Exec['apt_upgrade'],
}

package { 'terminator':
        ensure => present,
        require => Exec['apt_upgrade'],
}

package { 'playonlinux':
        ensure => present,
        require => Exec['apt_upgrade'],
}

package { 'openssh-server':
        ensure => present,
        require => Exec['apt_upgrade'],
}

package { 'pgadmin3':
	ensure => present,
        require => Exec['apt_upgrade'],
}

package { 'linphone':
	ensure => present,
        require => Exec['apt_upgrade'],
}


