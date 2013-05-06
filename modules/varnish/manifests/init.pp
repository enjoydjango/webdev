class varnish($varnish_memory="200MB"){

    package { 'varnish':
        ensure => installed,
        require => Exec['apt-get update']
    }

    file { '/etc/varnish/default.vcl':
        owner   => root,
        group   => root,
        mode    => 644,
        content  => template('varnish/default.vcl.erb'),
        require => Package['varnish'],
        notify  => Service['varnish']
    }

    file { '/etc/default/varnish':
        owner   => root,
        group   => root,
        mode    => 644,
        content => template('varnish/varnish.erb'),
        require => Package['varnish'],
        notify  => Service['varnish']
    }

    service { 'varnish':
        ensure      => running,
        enable      => true,
        hasrestart  => true,
        require     => Package['varnish']
    }

}
