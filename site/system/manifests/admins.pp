# system mysql admins
class system::admins {
  require mysql::server

  $users = {
    'zack@localhost'   => '1200',
    'monica@localhost' => '600',
    'ralph@localhost'  => false,
    'brad@localhost'   => '600',
    'luke@localhost'   => '600',
  }
  $users.each |String $user, Varient[Integer, Boolean] $queries| {
    if $queries == false {
      mysql_user { $user:
        ensure => absent,
      }
    } else {
      mysql_user { $user:
        ensure               => present,
        max_queries_per_hour => $queries,
      }
    }
    $nick = $user.split('@')[0]
    user { $nick:
      ensure => present,
    }
  }
}
