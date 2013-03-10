import "classes/*.pp"

class nginx {

  package { 'nginx':
      ensure => installed
  }

  file { '/etc/nginx/nginx.conf':
    owner   => root,
    group   => root,
    mode    => 644,
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx']
  }

  file { '/etc/nginx/sites-enabled/default':
    ensure => absent,
    notify => Service['nginx']
  }

  service { 'nginx':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    require     => Package['nginx']
  }

}
