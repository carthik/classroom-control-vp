class profile::exim { 
  include clamav
  include spamd
  
  class { '::exim':
    use_smarthost => true, 
    smarthost_route_data => 'mta.example.com',
    spam_scan => true,
    spamd_address => '127.0.0.1 783',
  }
}
