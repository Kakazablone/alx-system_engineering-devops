# A puppet manifest installing flask v 2.1.0
package {'python3':
  ensure => 'installed'
}

package {'python3-pip':
  ensure  => 'installed',
  require => Package['python3']
}

exec {'flask_installation':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/pip3 show flask | grep Version | grep 2.1.0',
  require => Package['python3-pip']
}
