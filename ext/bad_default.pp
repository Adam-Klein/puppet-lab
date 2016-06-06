
include git

$repo_user = 'vagrant'
$repo_root = '/var/repositories'
$clone = '/home/vagrant/production'

File {
  owner => $repo_user,
  group => 'pe-puppet',
}

Vcsrepo {
  provider => git,
  user     => $repo_user,
}

file { $repo_root :
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '1777',
}

vcsrepo { "${repo_root}/puppet-control.git":
  ensure   => bare, 
}

file { "${repo_root}/puppet-control.git/hooks/post-update":
  ensure => file,
  mode => '0755',
  source => 'puppet:///modules/learning/post-update',
  require => Vcsrepo["${repo_root}/puppet-control.git"],
}

vcsrepo { $clone:
  ensure  => present,
  source  => "${repo_root}/puppet-control.git",
  require => Vcsrepo["${repo_root}/puppet-control.git"],
}

