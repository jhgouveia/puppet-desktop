# default.pp

$packages = [
        		'alacarte',
                'apache2',
                'bpython3',
                'calibre',
                'chromium-browser',
        		'cifs-utils',
        		'curl',
                'davfs2',
                'dia',
                'filezilla',
        		'flashplugin-installer',
        		'fonts-sil-gentium-basic',
        	    'freemind',
        		'gedit-plugins',
        		'gimp',
        		'git',
                'gnucash',
            	'gparted',
                'gtkpod',
        		'inkscape',
                'keepass2',
        		'lame',
                'libappindicator1',
        		'libconfig-dev',
                'liblua5.2-dev',
                'libreadline-dev',
                'libssl-dev',
        		'lua5.2',
                'meld',
                'mencoder',
                'mtpfs',
        		'mtp-tools',
        		'mysql-workbench',
                'nmap',
        		'openssh-server',
                'openvpn',
                'p7zip',
        		'p7zip-rar',
                'pgadmin3',
                'pidgin',
                'playonlinux',
                'python-gpgme',
                'python-pip',
        		'python-psycopg2',
                'sflphone-gnome',
                'sni-qt:i386',
        		'terminator',
        		'tomboy',
                'tree',
        		'ubuntu-restricted-extras',
                'vim',
        		'vim-puppet',
                'virtualbox',
        		'vlc',
                'whois',
                'xclip',
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
