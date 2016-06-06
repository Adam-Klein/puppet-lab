# Manage groups
class profile::groups {
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