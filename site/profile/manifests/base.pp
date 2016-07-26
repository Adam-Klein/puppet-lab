# global base profile
class profile::base inherits profile::params {
  ini_setting { "puppet run interval":
    ensure  => present,
    path    => $::profile::params::puppetconfpath,
    section => 'agent',
    setting => 'runinterval',
    value   => '1800',
  }
}
