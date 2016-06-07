# Manage groups
class profile::linux::groups {
  group { 'staff':
    ensure => present,
  }

  group { 'admin':
    ensure => present,
  }

  group { 'dev':
    ensure => present,
  }
}