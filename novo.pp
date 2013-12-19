$packages = ['likewise-open', 'vim', 'cifs-utils', 'alacarte', 'pidgin', 'openjdk-7-jre', 'icedtea-7-plugin', 'ubuntu-restricted-extras', 'filezilla', 'mysql-workbench', 'keepass2', 'git', 'flashplugin-installer', 'python-gpgme', 'vim-puppet', 'libappindicator1', 'vlc', 'xclip', 'terminator', 'playonlinux', 'openssh-server', 'pgadmin3', 'fonts-sil-gentium-basic', 'sflphone-gnome', 'curl', 'p7zip', 'p7zip-rar'] 


class unifocus-context::msfonts {
  exec { "accept-msttcorefonts-license":
    command => "/bin/sh -c \"echo ttf-mscorefonts-installer msttcorefonts/accepted-     mscorefonts-eula select true | debconf-set-selections\""
  }

  package { "msttcorefonts":
    ensure  => installed,
    require => Exec['accept-msttcorefonts-license']
  }
}

package { 'virtualbox':
	ensure => present,
}


package { 'mtp-tools':
	ensure => present,
}


package { 'mtpfs':
	ensure => present,
}


package { 'gimp':
	ensure => present,
}


package { 'chromium-browser':
	ensure => present,
}


package { 'tomboy':
	ensure => present,
}


package { 'davfs2':
	ensure => present,
}


package { $packages:
	ensure => present,
}

Package['icedtea-7-plugin'] {
	require => Package['openjdk-7-jre'],
}

Package['p7zip-rar'] {
	require => Package['p7zip'],
}

