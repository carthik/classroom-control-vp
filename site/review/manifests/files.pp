class review::files {
  file { '/etc/shells':
    ensure => present,
  }

  file { '/etc/motd':
    ensure  => present,
    content => epp('review/motd.epp'),
  }
}
