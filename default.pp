exec { 'apt_get_update':
        command => 'sudo apt-get update',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
}

exec { 'apt_get_dist-upgrade':
        command => 'sudo apt-get dist-upgrade',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Exec['apt_get_update'],
}

package {'likewise-open':
        ensure => present,
        require => Exec['apt_get_dist-upgrade'], 
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


/*

# package example
package {'':
	ensure => present,
	require => Package[''],
}

*/



/*

# Modify to ensure execution only if computer has not joined domain yet
exec { 'likewise_join_domain':
        command => 'sudo domainjoin-cli join interlegis.gov.br gouveia',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Package['likewise-open'],
}
*/




/*

package {'apache2':
        ensure => present,
        require => Exec['apt_get_update'], 
}

package {'minidlna':
        ensure => present,
        require => Package['apache2']
}

exec { 'get_minidlna_conf':
        command => 'wget http://www.gouveia.pro/dev/minidlna.conf -P /tmp/.',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Package['minidlna']
}

exec { 'copy_minidlna_conf':
        command => 'sudo cp /tmp/minidlna.conf /etc/.',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Exec['get_minidlna_conf']
}

*/
