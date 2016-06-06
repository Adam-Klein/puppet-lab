# Manage files
class profile::files {
  file { '/etc/motd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/profile/motd',
  }

  file { '/etc/environment':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode   => '0644',
    content => 'production',
  }

  file { '/etc/shells':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode   => '0644',
    source => 'puppet:///modules/profile/shells',
  }
}