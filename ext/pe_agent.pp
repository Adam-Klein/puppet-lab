augeas { 'faster puppet':
  context => '/files/etc/puppetlabs/puppet/puppet.conf/agent',
  changes => 'set runinterval 30',
}