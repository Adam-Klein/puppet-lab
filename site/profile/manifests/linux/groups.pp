# Manage groups
class profile::linux::groups {
  $groups=['staff','admin','dev']

  group { $groups:
    ensure => present,
  }
}
