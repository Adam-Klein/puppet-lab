# base profile
class profile::base {
  include ::sudo
  
  user { 'test':
    ensure => present,
    gid => 'staff',
  }

  service { 'sshd': ensure => running, }
}
