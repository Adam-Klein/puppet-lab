# base profile
class profile::base {
  user { 'test':
    ensure => present,
    gid => 'staff',
  }
}
