file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => "# Other SSH configurations...\nIdentityFile ~/.ssh/school\nPasswordAuthentication no\n",
  notify  => Service['ssh'],
}

service { 'ssh':
  ensure => running,
}
