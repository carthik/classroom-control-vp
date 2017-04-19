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
  file_line { 'disallow anyone but root for cron jobs':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
  }

  # What concat resource is needed for this fragment to work?
  concat { '/etc/motd':
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => epp('files/motd_header.epp'),
  }

  concat::fragment { 'motd middle':
    target  => '/etc/motd',
    order   => '02',
    content => 'wassup',
  }

  concat::fragment { 'motd bottom':
    target  => '/etc/motd',
    order   => '03',
    content => 'this is PSA.',
  }

}
