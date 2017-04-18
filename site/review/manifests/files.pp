class review::files {
  file {'/etc/shells':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/review/shells',
   }
   file {'/etc/motd':
     ensure => file,
     owner => 'root',
     group => 'toor',
     mode => ' 0644',
     source => epp('review/motd.epp'),
   }
 }
