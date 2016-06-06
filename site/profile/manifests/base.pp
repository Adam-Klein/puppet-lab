# base profile
class profile::base {
  user { 'test':
    ensure => present,
    gid => 'staff',
  }

  service { 'sshd': ensure => running, }
}
