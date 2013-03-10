# Global defaults
Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin' }
File { owner => 0, group => 0, mode  => 0644 }

#
# basenode
#
# Base node configuration: Every node must inherit from this one.
#

node basenode {

  package { ['vim', 'git-core', 'curl', 'build-essential', 'htop']:
    ensure => installed
  }

  # Setup node timezone
  package { 'tzdata':
    ensure => installed
  }

  file { '/etc/localtime':
    source  => 'file:///usr/share/zoneinfo/Europe/London',
    links => 'follow',
    owner   => root,
    group   => root,
    mode    => 644,
    require => Package['tzdata'],
    notify  => Exec['dpkg-reconfigure tzdata']
  }

  file {'/etc/timezone':
    content => "Europe/London\n",
    notify  => Exec['dpkg-reconfigure tzdata'],
    ensure  => 'present'
  }

  exec { 'dpkg-reconfigure tzdata':
    command     => 'dpkg-reconfigure -f noninteractive tzdata',
    refreshonly => true
  }

  # Setup node locale to en_GB
  file { '/etc/default/locale':
    content => "LANG='en_GB.UTF-8'\nLANGUAGE='en_GB:en'\n"
  }

}
