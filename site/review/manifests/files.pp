class review::files {
  file { '/etc/shells':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/review',
  }
}
