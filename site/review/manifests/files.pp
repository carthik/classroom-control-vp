# File management class
class review::files {
  file { '/etc/shells':
    ensure => 'file',
    source => 'puppet:///modules/review/shells',
  }
  file { '/etc/motd':
    ensure  => 'file',
    content => epp('review/motd.epp'),
  }
}
