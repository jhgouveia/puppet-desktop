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

exec { 'likewise_join_domain':
        command => 'sudo domainjoin-cli join interlegis.gov.br gouveia',
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:',
        require => Package['likewise-open'],
}




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
