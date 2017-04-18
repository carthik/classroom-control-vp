class review::files {
  file { '/etc/shells':
    ensure => file,
  }
  file { '/etc/motd':
    ensure => file,
    content => epp('review/motd.epp'),
  }
}
