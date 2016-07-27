# base profile
class profile::linux::base {
  user { 'test':
    ensure => present,
    gid => 'staff',
  }

  user { 'matt':
    ensure => present,
    gid => 'staff',
  }

  user { 'alklein':
    ensure  => 'present',
    gid => 'staff',
    managehome => 'true'
  }

  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }

  class { 'sudo':
    purge               => false,
    config_file_replace => false,
  }

  include sudo::configs

  sudo::conf { 'test':
    priority => 10,
    content  => "test ALL=(ALL) NOPASSWD: ALL",
  }

  sudo::conf { 'default':
    priority => 02,
    source   => 'puppet:///modules/profile/sudoers',
  }
}
