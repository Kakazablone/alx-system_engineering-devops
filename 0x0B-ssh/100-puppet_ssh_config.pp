file { '/home/samba/.ssh/config':
  ensure  => present,
  content => [
    '# Turn off passwd auth',
    'PasswordAuthentication no',
    '',
    '# Declare identity file',
    'IdentityFile ~/.ssh/school',
  ].join("\n"),
}
