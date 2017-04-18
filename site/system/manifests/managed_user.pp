define system::managed_user (
  $home = undef,
  $password = undef,
) {
  $user = $name
  if $home {
    $homedir = $home
  }
  else {
    $homedir = "/home/${user}"
  }

  File {
    owner => $user,
    group => 'wheel',
    mode  => '0644',
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
    home       => $homedir,
    password   => $password,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc'
  }

}
