# default.pp

include apt

apt::ppa { 'ppa:diesch/testing': }

apt::ppa { 'ppa:atareao/atareao': }

apt::ppa { 'ppa:jconti/recent-notifications': }

$packages = [
        	    'alacarte',
                'android-tools-adb',
                'apache2',
                'bpython3',
                'calibre',
                'chromium-browser',
            	'cifs-utils',
            	'curl',
                'davfs2',
                'dia',
        		'easytag',
                'filezilla',
            	'flashplugin-installer',
        	    'fonts-sil-gentium-basic',
            	'freemind',
            	'gedit-plugins',
            	'gimp',
        	    'git',
                'gksu',
                'gnucash',
            	'gparted',
                'gtkpod',
                'indicator-multiload',
            	'inkscape',
                'keepass2',
                'kolourpaint4',
            	'lame',
                'libappindicator1',
            	'libconfig-dev',
                'liblua5.2-dev',
                'libreadline-dev',
                'libssl-dev',
        	    'lua5.2',
                'meld',
                'mplayer2',
                'mtpfs',
            	'mtp-tools',
                'my-weather-indicator',
            	'mysql-workbench',
		        'nfs-common',
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
                'python-setuptools',
                'python-tk',
                'radiotray',
	        	'ripperx',
                'sflphone-gnome',
                'sni-qt:i386',
                'sound-juicer',
        	    'terminator',
                'sqlitebrowser',
            	'tomboy',
                'tree',
            	'ubuntu-restricted-extras',
                'unity-tweak-tool',
		        'vagrant',
                'vim',
            	'vim-puppet',
                'virtualbox',
            	'vlc',
                'whois',
                'xclip'
            ]


exec { 'pip-install':
  command => 'pip install pelican markdown virtualenv ipython django',
  path    => '/usr/bin/'
}


class unifocus-context::msfonts {
  exec { 'accept-msttcorefonts-license':
    command => '/bin/sh -c \'echo ttf-mscorefonts-installer msttcorefonts/accepted-     mscorefonts-eula select true | debconf-set-selections\''
  }


  package { 'msttcorefonts':
    ensure  => installed,
    require => Exec['accept-msttcorefonts-license']
  }
}


package { $packages:
	ensure => present,
}

package { 'classicmenu-indicator':
    require => Apt::Ppa['ppa:diesch/testing']
}

package { 'touchpad-indicator':
    require => Apt::Ppa['ppa:atareao/atareao']
}

#package { 'indicator-notifications':
#    require => Apt::Ppa['ppa:jconti/recent-notifications']
#}

Package['p7zip-rar'] {
	require => Package['p7zip'],
}

# A INSTALAR
# ppa:webupd8team/y-ppa-manager


#Package['icedtea-7-plugin'] {
#	require => Package['openjdk-7-jre'],
#}


#apt::sources_list {'camptocamp':
#  ensure  => present,
#    content => 'deb http://dev.camptocamp.com/packages/ etch puppet',
#}
