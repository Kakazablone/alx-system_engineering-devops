file {'/etc/ssh/ssh_config':
  ensure => present,
  content =>"
  #config .ssh for server connect
  Host*
  IdentityFile ~/.ssh/school
  PasswordAuthentication no
  "
}
