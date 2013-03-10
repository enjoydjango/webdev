class nginx::loadbalancer{

    include nginx

    file { '/etc/nginx/sites-enabled/loadbalancer.example.com':
        owner   => root,
        group   => root,
        mode    => 644,
        content => template('nginx/loadbalancer.example.com.erb'),
        require => Package['nginx'],
        notify  => Service['nginx']
    }

}
