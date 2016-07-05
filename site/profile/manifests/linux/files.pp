# Manage files
class profile::linux::files {
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/motd':
    source => 'puppet:///modules/profile/motd',
  }

  file { '/etc/environment':
    content => 'production',
  }

  file { '/etc/shells':
    source => 'puppet:///modules/profile/shells',
  }
}
