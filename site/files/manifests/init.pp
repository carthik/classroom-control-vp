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
  file_line { 'disallow other cron jobs':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
  }
  
  concat { '/etc/motd':
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  # What concat resource is needed for this fragment to work?
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => epp('files/motd_header.epp'),
  }

  # Add a few fragments to be appended to /etc/motd
  concat::fragment { 'motd 01':
    target => '/etc/motd',
    order  => '03',
    content => "Hi there....\n",
  }

  concat::fragment { 'motd 02':
    target => '/etc/motd',
    order  => '04',
    content => "Bye there....\n",
  }

}
