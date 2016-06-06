# base profile
class profile::base {
  include ::sudo
  include ::sudo::configs

  user { 'test':
    ensure => present,
    gid => 'staff',
  }

  service { 'sshd': ensure => running, }
}
