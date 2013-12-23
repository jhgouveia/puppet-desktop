# default.pp

$packages = [	'likewise-open',
		'vim',
		'cifs-utils',
		'alacarte',
		'pidgin',
		'openjdk-7-jre',
		'icedtea-7-plugin',
		'ubuntu-restricted-extras',
		'filezilla',
		'mysql-workbench',
		'keepass2',
		'git',
		'flashplugin-installer',
		'python-gpgme',
		'vim-puppet',
		'libappindicator1',
		'vlc',
		'xclip',
		'terminator',
		'playonlinux',
		'openssh-server',
		'pgadmin3',
		'fonts-sil-gentium-basic',
		'sflphone-gnome',
		'curl',
		'p7zip',
		'p7zip-rar',
		'virtualbox',
		'mtp-tools',
		'mtpfs',
		'gimp',
		'chromium-browser',
		'tomboy',
		'davfs2',
		'pdftohtml',
		'lame',
		'ffmpeg',
		'gtkpod'
	] 


class unifocus-context::msfonts {
  exec { "accept-msttcorefonts-license":
    command => "/bin/sh -c \"echo ttf-mscorefonts-installer msttcorefonts/accepted-     mscorefonts-eula select true | debconf-set-selections\""
  }

  package { "msttcorefonts":
    ensure  => installed,
    require => Exec['accept-msttcorefonts-license']
  }
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


/*
apt::sources_list {"camptocamp":
  ensure  => present,
    content => 'deb http://dev.camptocamp.com/packages/ etch puppet',
}
*/
