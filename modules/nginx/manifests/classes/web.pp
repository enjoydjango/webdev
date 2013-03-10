class nginx::web{

    include nginx

    file { '/etc/nginx/sites-enabled/web1.example.com':
        owner   => root,
        group   => root,
        mode    => 644,
        content => template('nginx/web.example.com.erb'),
        require => Package['nginx'],
        notify  => Service['nginx']
    }

}
