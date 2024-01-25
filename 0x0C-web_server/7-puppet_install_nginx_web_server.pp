# Automating project requirements using Puppet

package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/redirect_me':
  ensure  => present,
  content => 'location /redirect_me {
                return 301 https://github.com/Kakazablone;
            }',
}

file { '/etc/nginx/sites-enabled/redirect_me':
  ensure => link,
  target => '/etc/nginx/sites-available/redirect_me',
  require => File['/etc/nginx/sites-available/redirect_me'],
  notify => Service['nginx'],
}
