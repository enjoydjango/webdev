class nginx::loadbalancervarnish{

    include nginx

    file { '/etc/nginx/sites-enabled/loadbalancervarnish.example.com':
        owner   => root,
        group   => root,
        mode    => 644,
        content => template('nginx/loadbalancervarnish.example.com.erb'),
        require => Package['nginx'],
        notify  => Service['nginx']
    }

}
