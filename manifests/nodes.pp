import 'base'

#
# loadbalancer.example.com
#
# Load Balancer example node using nginx + HAProxy
#

node 'loadbalancer.example.com' inherits basenode {

  # nginx
  include nginx
  include nginx::loadbalancer

  # aproxy
  include haproxy

}


#
# loadbalancervarnish.example.com
#
# Load Balancer example node using nginx + HAProxy + Varnish
#

node 'loadbalancervarnish.example.com' inherits basenode {

  # nginx
  include nginx
  include nginx::loadbalancervarnish

  # aproxy
  include varnish

  # aproxy
  include haproxy

}


#
# web1.example.com
#
# Really simple web server #1
#

node 'web1.example.com' inherits basenode {

  # nginx
  include nginx
  include nginx::web

  file { "/home/vagrant/www/":
      group   => 'www-data',
      owner   => 'www-data',
      ensure  => directory
  }

  file { "/home/vagrant/www/index.html":
      group   => 'www-data',
      owner   => 'www-data',
      content  => "<h1>web1</h1>",
      require => File["/home/vagrant/www/"]
  }

}


#
# web2.example.com
#
# Really simple web server #2
#

node 'web2.example.com' inherits basenode {

  # nginx
  include nginx
  include nginx::web

  file { "/home/vagrant/www/":
      group   => 'www-data',
      owner   => 'www-data',
      ensure  => directory
  }

  file { "/home/vagrant/www/index.html":
      group   => 'www-data',
      owner   => 'www-data',
      content  => "<h1>web2</h1>",
      require => File["/home/vagrant/www/"]
  }

}
