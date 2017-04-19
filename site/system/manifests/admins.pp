class system::admins {
  require mysql::server
  
  $users = {
    'zack' => {
      'queries' => 1200,
    },
    'monica' => {
      'queries' => 600,
    },
    'brad' => {
      'queries' => 600,
    },
    'luke' => {
      'queries' => 600,
    },
  }
  
  $retired = [
    'ralph'
  ]
  
  $users.each |String $user, $query| {
    mysql_user { "${user}@localhost":
      ensure => present,
      max_queries_per_hour => $query['queries'],
    }
  
    user { $user:
     ensure => present,
     managehome => true,
    }
  }
  
  $retired.each |String $user| {
    mysql_user { "${user}@localhost":
      ensure => absent,
    }
    user { $user:
     ensure => absent,
    }
  }
}
