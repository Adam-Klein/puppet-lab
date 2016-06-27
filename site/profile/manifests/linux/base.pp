# base profile
class profile::linux::base {
  user { 'test':
    ensure => present,
    gid => 'staff',
  }

 service { 'sshd':
   ensure => 'running',
   enable => 'true',
  }

}
