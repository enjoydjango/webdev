class haproxy {

  package { 'haproxy':
      ensure => installed,
      require => Exec['apt-get update']
  }

  file { '/etc/haproxy/haproxy.cfg':
      owner   => root,
      group   => root,
      mode    => 644,
      content => template('haproxy/haproxy.cfg.erb'),
      require => Package['haproxy'],
      notify  => Service['haproxy']
  }

  file { '/etc/default/haproxy':
    owner   => root,
    group   => root,
    mode    => 644,
    source  => 'puppet:///modules/haproxy/haproxy',
    require => Package['haproxy'],
    notify  => Service['haproxy']
  }

  service { 'haproxy':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    require     => Package['haproxy']
  }

}
