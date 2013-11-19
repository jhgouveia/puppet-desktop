package {'likewise-open':
        ensure => present,
}

package {'vim':
        ensure => present,
}

package {'cifs-utils':
	ensure => present,
}

package {'alacarte':
	ensure => present,
}

package {'pidgin':
	ensure => present,
}

package {'openjdk-7-jre':
	ensure => present,
}

package {'icedtea-7-plugin':
	ensure => present,
	require => Package['openjdk-7-jre'],
}

package {'ubuntu-restricted-extras':
	ensure => present,
}

package {'filezilla':
	ensure => present,
}

package {'mysql-workbench':
	ensure => present,
}

package {'keepass2':
	ensure => present,
}

package {'git':
	ensure => present,
}

package {'flashplugin-installer':
	ensure => present,
}

package { 'python-gpgme':
	ensure => present,
}

package { 'vim-puppet':
	ensure => present,
}

package { 'libappindicator1':
	ensure => present,
}

package { 'vlc':
        ensure => present,
}

package { 'xclip':
        ensure => present,
}

package { 'terminator':
        ensure => present,
}

package { 'playonlinux':
        ensure => present,
}

package { 'openssh-server':
        ensure => present,
}

package { 'pgadmin3':
	ensure => present,
}

class unifocus-context::msfonts {
  exec { "accept-msttcorefonts-license":
    command => "/bin/sh -c \"echo ttf-mscorefonts-installer msttcorefonts/accepted-     mscorefonts-eula select true | debconf-set-selections\""
  }

  package { "msttcorefonts":
    ensure  => installed,
    require => Exec['accept-msttcorefonts-license']
  }
}

package { 'fonts-sil-gentium-basic':
	ensure => present,
}

package { 'sflphone-gnome':
	ensure => present,
}

package { 'curl':
	ensure => present,
}

package { 'p7zip':
	ensure => present,
}

package { 'p7zip-rar':
	ensure => present,
	require => Package['p7zip'],
}


