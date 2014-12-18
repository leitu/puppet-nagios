class nagios::install inherits nagios {
  group { $group_name :
    ensure => present,
  } ->
  user { $user_name :
    ensure => present,
  } ->
  package { $package_name :
    ensure => $package_ensure,
    alias  => 'nrpe',
  }
}
