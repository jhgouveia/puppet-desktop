# default.pp

$packages = [   'apache2',
                'bpython3',
                'vim',
        		'cifs-utils',
                'dia',
        		'alacarte',
                'pidgin',
        		'ubuntu-restricted-extras',
                'filezilla',
        		'mysql-workbench',
                'keepass2',
        		'git',
                'gnucash',
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
        		'lame',
                'gtkpod',
        		'inkscape',
                'libreadline-dev',
        		'libconfig-dev',
                'libssl-dev',
        		'lua5.2',
                'liblua5.2-dev',
        		'python-psycopg2',
                'sni-qt:i386',
        		'gedit-plugins',
                'whois',
        	    'freemind',
                'mencoder',
                'nmap',
            	'gparted',
                'calibre',
                'python-pip',
                'tree',
                'meld',
                'openvpn',
                'yad'
            ]


exec { "pip-install":
  command => "pip install pelican markdown",
  path    => "/usr/bin/"
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


package { $packages:
	ensure => present,
}


Package['p7zip-rar'] {
	require => Package['p7zip'],
}


# A INSTALAR
# ppa:webupd8team/y-ppa-manager


#Package['icedtea-7-plugin'] {
#	require => Package['openjdk-7-jre'],
#}


#apt::sources_list {"camptocamp":
#  ensure  => present,
#    content => 'deb http://dev.camptocamp.com/packages/ etch puppet',
#}
