class nagios::params {
  $user_name = 'nagios'
  $group_name = 'nagios'
  $owner = 'nagios'
  case $::osfamily {
    'Redhat' : {
      $package_name = 'nrpe-nagios'
    }
    default : {
      fail( "Your ${::osfamily} is not supported yet")
    }
  }

  $check_names = {
    'check_users' => '/usr/local/nagios/libexec/check_users -w 5 -c 10',
    'check_load' => '/usr/local/nagios/libexec/check_load -w 15,10,5 -c 30,25,20',
    'check_hda1' => '/usr/local/nagios/libexec/check_disk -w 20% -c 10% -p /dev/hda1',
    'check_zombie_procs' => '/usr/local/nagios/libexec/check_procs -w 5 -c 10 -s Z',
    'check_total_procs' => '/usr/local/nagios/libexec/check_procs -w 300 -c 500',
    'check_swap_native' => '/usr/local/nagios/libexec/check_swap -w 50% -c 20%',
    'check_home' => '/usr/local/nagios/libexec/check_disk -w 20% -c 10% -p /home',
    'check_swap' => '/usr/local/nagios/libexec/check_disk -w 20% -c 11% -p /swap',
    'check_var' => '/usr/local/nagios/libexec/check_disk -w 20% -c 11% -p /var',
    'check_sneaker' => '/usr/local/nagios/libexec/check_procs -C ruby -a sneaker -c 7',
    'check_rabbitmq_proc' => '/usr/local/nagios/libexec/check_procs -C rabbitmq-server',
    'check_rabbitmq_server' => "/usr/local/nagios/libexec/contrib/check_rabbitmq_server -H ${::hostname} --port 15672",
    'check_redis' => '/usr/local/nagios/libexec/check_procs -C redis-server',
    'check_redis_port' => '/usr/local/nagios/libexec/check_tcp -H 127.0.0.1 -p 6379',
    'check_beeper' => '/usr/local/nagios/libexec/check_procs -C node -a server',
    'check_beeper_port' => '/usr/local/nagios/libexec/check_tcp -H 127.0.0.1 -p 5678',
    'check_vnc' => '/usr/local/nagios/libexec/check_procs -C python -a websockify',
    'check_vnc_port' => '/usr/local/nagios/libexec/check_tcp -H 127.0.0.1 -p 6080',
    'check_mysql' => '/usr/local/nagios/libexec/check_mysql -uroot -ptwer123',
    'check_mysql_port' => '/usr/local/nagios/libexec/check_tcp -H 127.0.0.1 -p 3306',
    'check_nginx' => '/usr/local/nagios/libexec/contrib/check_nginx.sh -H localhost -P 80 -p /opt/nginx/logs -n nginx.pid -w 5000 -c 10000',
    'check_passenger' => '/usr/local/nagios/libexec/check_procs -C ruby -a Passenger',
    'check_foreman' => '/usr/local/nagios/libexec/check_foreman_proxy',
  }
}
