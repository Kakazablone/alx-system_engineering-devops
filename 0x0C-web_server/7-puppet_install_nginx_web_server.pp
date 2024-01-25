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

file { '/etc/nginx/sites-enabled/default':
  ensure  => present,
  content => "server_name _;\n
                  location /redirect_me {\n
                      return 301 https://github.com/Kakazablone;\n
                      }",
  require => Service['nginx'],
  notify  => Service['nginx'],
}
