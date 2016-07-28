# Apache web server base profile to install apache httpd
class profile::apache::base {
  $conffile = '/etc/httpd.conf'

# Define package
  package {'apache':
    ensure  =>  present,
    name    =>  'httpd',
    before  =>  File['apache-conf'],
  }

# Define service
  service{'apache-service':
    ensure    => running,
    enable    => true,
    require   => package['apache']
    subscribe => File['apache-conf'],
  }

# Define file
  file {'apache-conf':
    ensure  => file,
    path    => $conffile,
    require => package['apache'],
    notify  => service['apache-service']
  }
