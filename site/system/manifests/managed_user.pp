define system::managed_user ( 
  $password,
  $home = undef,
) {
if $home {
  $homedir = $home
}
else {
  $homedir = "/home/${name}"
}

# Puppet will evaluate these resources in the proper order because it's smart # and knows about dependencies between files and their owners
user { $name:
  ensure => present,
  password => $password,
  managehome => true,
}

  if $kernel == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      owner => $name,
      group => $name,
      mode => '0644',
      source => 'puppet:///modules/system/bashrc'
    } 
  }
}
