class nagios::service inherits nagios {
  service { 'nrpe' :
    ensure => $service_ensure,
    enable => true,
    name   => 'nrpe',
   }
}
