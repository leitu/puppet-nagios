# == Class: nagios
#
# Full description of class nagios here.
#
# === Parameters
#
# Document parameters here.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*role*]
#   specific the server's role in order to make the server not install the unneceray things.
#
# === Examples
#
#  class { 'nagios':
#    role => 'client',
#  }
#
# === Authors
#
# Author Name ltu@thoughtworks.com
#
# === Copyright
#
# Copyright 2014 Lei Tu.
#
class nagios (
  $nagios_server  = '10.18.10.2',
  $package_name   = $nagios::params::package_name,
  $service_ensure = 'running',
) inherits nagios::params {

  if is_ip_address($nagios_server) !=true {
    fail('Please input a validate ip address')
  }
    anchor { 'nagios::begin' : }
    ~> class { 'nagios::install' : }
    -> class { 'nagios::config'  : }
    ~> class { 'nagios::service' : }
    ~> anchor { 'nagios::end' : }
}
