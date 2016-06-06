# base profile
class profile::base {
  service { 'sshd':
    ensure => 'running',
  }
}
