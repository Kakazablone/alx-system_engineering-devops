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

# Index.html page
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
  require => Service['nginx'],
}

# 301 Redirection
file_line { 'redirect_me_location':
  path   => '/etc/nginx/sites-available/default',
  line   => '        location /redirect_me {',
  match  => '^.*server_name _;.*$',
  before => '        location / {',
  notify => Service['nginx'],
}

file_line { 'redirect_me_return':
  path   => '/etc/nginx/sites-available/default',
  line   => '            return 301 https://github.com/Kakazablone;',
  match  => '^.*location /redirect_me {.*$',
  after  => '        location /redirect_me {',
  notify => Service['nginx'],
}

# Custom 404 page
file_line { 'custom_404_page':
  path   => '/etc/nginx/sites-available/default',
  line   => '        error_page 404 /404.html;',
  match  => '^.*server_name _;.*$',
  before => '        location / {',
  notify => Service['nginx'],
}

# Nginx header
file_line { 'custom_nginx_header':
  path   => '/etc/nginx/sites-available/default',
  line   => '        add_header X-Served-By $hostname;',
  match  => '^.*server_name _;.*$',
  before => '        location / {',
  notify => Service['nginx'],
}
