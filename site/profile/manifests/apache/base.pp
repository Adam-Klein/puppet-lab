# Apache web server base profile
class profile::apache::base {
  $conffile = '/etc/httpd.conf'

  package {'apache':
    ensure  =>  present,
    name    =>  'httpd',
    before  =>  File['apache-conf'],
  }

  service{'apache-service':
    ensure    => running,
    enable    => true,
    require   => package['apache']
    subscribe => File['apache-conf'],
  }

  file {'apache-conf':
    ensure  => file,
    path    => $conffile,
    require => package['apache'],
    notify  => service['apache-service']
  }
