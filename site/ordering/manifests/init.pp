class ordering {
  include ordering::mysql
  # Does it need to be contained? no

  notify { 'This should come after the entire MySQL class is enforced':
    require => Class['ordering::mysql'],
  }
}
