 class nagios::config inherits nagios {
  file { '/usr/local/nagios':
    ensure  => directory,
    owner   => $user_name,
    group   => $group_name,
    mode    => '0755',
    recurse => true,
  } ->
  file { '/usr/local/nagios/etc/nrpe.cfg' :
    ensure  => present,
    owner   => $user_name,
    group   => $group_name,
    content => template('nagios/nrpe.cfg.erb')
  }
}
