class system::admins {
  require mysql::server
  
  $default_max_queries_per_hour = 600
  
  $active_admins = { 
    'zack' => { max_queries_per_hour => 1200 },
    'monica' => {},
    'brad' => {},
    'luke' => {}
  }
  
  $inactive_admins = [ 'ralph' ]
  
  $active_admins.each |String $admin, Hash $data| {
    $max_queries_per_hour = $data['max_queries_per_hour']
  
    mysql_user { "${admin}@localhost":
      ensure => present,
      max_queries_per_hour => pick($max_queries_per_hour, $default_max_queries_per_hour)
    }
    
    user { $admin:
      ensure => present,
    }
  }
  
  $inactive_admins.each |String $admin| {
    mysql_user { "${admin}@localhost":
      ensure => absent,
    }
    
    user { $admin:
      ensure => absent,
    }
  }
}
