augeas {
  context => '/files/etc/puppetlabs/puppet/puppet.conf/agent',
  changes => 'set runinterval 100',
}

service { 'sshd':
  ensure => 'stopped',
}