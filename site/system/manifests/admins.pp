class system::admins {
  require mysql::server

  $admins = {
    'zack' => { max_queries_per_hour =>  '600' },
    'monica' => { max_queries_per_hour =>  '600' },
    'ralph' => { max_queries_per_hour =>  '600' },
    'brad' => { max_queries_per_hour =>  '600' },
    #'luke' => { max_queries_per_hour =>  '1200' },
  }

  $retired = ['luke']

  $admins.each |$user, $params| {

    notify { "Adding $user": }

    mysql_user { "${user}@localhost":
      ensure               => present,
      max_queries_per_hour => $params['max_queries_per_hour'],
    }

    user { $user:
      ensure     => present,
      managehome =>  true,
    }
  }

  $retired.each |$user| {

    notify { "Deleting $user": }

    mysql_user { "${user}@localhost":
      ensure => absent,
    }

    user { $user:
      ensure => absent,
    }
  }
}
