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
exec { 'add_custom_nginx_header':
  command  => "sudo sed -i '47i\\        add_header X-Served-By \$hostname;' /etc/nginx/sites-enabled/default",
  notify   => Service['nginx'],
}
