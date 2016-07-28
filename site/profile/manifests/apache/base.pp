# Apache web server base profile to install apache httpd

class profile::apache::base {
  $conffile = '/etc/httpd.conf'

# Define package
  package {'apache':
    ensure  =>  present,
    name    =>  'httpd',
    before  =>  File['apache-conf'],
  }

# Define file
  file {'apache-conf':
    ensure  => file,
    path    => $conffile,
  }

# Define service
  service{'httpd':
    ensure    => running,
    enable    => true,
    subscribe => File['apache-conf'],
  }
}
