class files {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  file { '/etc/cron.allow':
    ensure => file,
  }
  file_line { 'allow root cron jobs':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }
  # Add a rule to cron.deny to deny jobs by default
  file_line { 'deny default cron jobs':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => 'default',
  }
  # What concat resource is needed for this fragment to work?
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => epp('files/motd_header.epp'),
  }

  # Add a few fragments to be appended to /etc/motd
  concat::fragment { 'another line':
    target  => '/etc/motd',
    order   => '03',
    content => 'This is fragment 3. Have a nice day.',
  }
  
  concat::fragment { 'another other line':
    target  => '/etc/motd',
    order   => '02',
    content => 'Tempus Fugit',
  }

}
