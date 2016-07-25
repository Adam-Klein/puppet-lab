# Apache web server base profile
class profile::apache::base {
  package { 'httpd'}:
    ensure => present,
  }

  service{'httpd':
    ensure => "running",
    enable => "true",
    require => package["apache"],
  }

  file {'/etc/httpd.conf':
    target => '/etc/httpd.conf',
    notify => service["httpd"],
  }
