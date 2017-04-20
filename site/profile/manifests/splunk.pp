class profile::splunk {
  class { '::splunk':
    httpport    => 8000,
    kvstoreport => 8191,
    inputport   => 9997,
  }
}
