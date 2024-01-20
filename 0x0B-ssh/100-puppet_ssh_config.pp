file { '/home/samba/.ssh/config':
  ensure  => present,
  owner   => 'samba',
  group   => 'samba',
  mode    => '0600',
  content => "# SSH client configuration\n
              Host 100.25.102.191
                  User ubuntu
                  IdentityFile ~/.ssh/school
                  PasswordAuthentication no\n"
}
