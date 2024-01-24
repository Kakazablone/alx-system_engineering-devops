# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

# Create the virtual host configuration
nginx::resource::vhost { 'default':
  ensure       => present,
  www_root     => '/var/www/html',
  listen_port  => '80',
}

# Add the rewrite rule
nginx::resource::rewrite { 'redirect_rule':
  vhost     => 'default',
  match     => '^/redirect_me',
  target    => 'https://www.github.com/Kakazablone',
  redirect  => 'permanent',
}
