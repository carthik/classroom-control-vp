class review::files {
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/shells':  
    source => 'puppet:///modules/review/shells',
  }
  
  file { '/etc/motd':
    content => epp('review/motd.epp'),
  }
}
