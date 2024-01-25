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

exec {sudo sed -i '/server_name _;/a'\
            'location /redirect_me {
                return 301 https://github.com/Kakazablone;
            }' /etc/nginx/sites-enabled/default
  provider => shell
}
