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

exec { 'configure_nginx_redirect':
  command  => 'sed -i "s/listen 80 default_server;/listen 80 default_server;\\n\\tlocation \/redirect_me {\\n\\t\\treturn 301 https:\/\/github.com\/Kakazablone\/;\\n\\t}/" /etc/nginx/sites-available/default',
  provider => shell,
  require  => Service['nginx'],
  notify   => Service['nginx'],
}
