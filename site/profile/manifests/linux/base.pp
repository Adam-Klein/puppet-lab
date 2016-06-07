# base profile
class profile::linux::base {
  include ::sudo
  include ::sudo::configs

  user { 'test':
    ensure => present,
    gid => 'staff',
  }

  service { 'sshd': ensure => running, }
}
