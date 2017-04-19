define files::motd (
  $message = $name,
  $order   = 10,
) {
  # what resource declaration do we need to add to the `motd` concat resource?
  concat::fragment { "motd fragment: ${name}":
    target  => '/etc/motd',
    order   => $order,
    content =>  $message,
  }
}
