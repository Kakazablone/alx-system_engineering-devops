# puppet_nginx_setup.pp

# Update package information
package { 'nginx':
  ensure => 'latest',
}

# Start Nginx service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

# Nginx header
file_line { 'custom_nginx_header':
  path   => '/etc/nginx/sites-available/default',
  line   => '        add_header X-Served-By $hostname;',
  match  => '^.*server_name _;.*$',
  before => '        location / {',
  notify => Service['nginx'],
}
