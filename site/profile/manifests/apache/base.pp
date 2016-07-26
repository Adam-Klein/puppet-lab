# Apache web server base profile
class profile::apache::base {
  $conffile = '/etc/httpd.conf'

  package {'apache'}:
    name => httpd,
    ensure => present,
  }

  service{'apache-service':
    ensure => "running",
    enable => "true",
    require => package['apache']
    subscribe => File['apache-conf'],
  }

  file {'apache-conf':
    path => $conffile,
    ensure => file,
    notify => service['apache-service']
    require => package['apache'],
  }
