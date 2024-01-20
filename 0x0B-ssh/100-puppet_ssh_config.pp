file { '/home/samba/.ssh/config':
  ensure  => file,
  content => [
    '# Turn off passwd auth',
    'PasswordAuthentication no',
    '',
    '# Declare identity file',
    'IdentityFile ~/.ssh/school'
  ].join("\n"),
}
