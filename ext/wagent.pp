ini_setting { "faster puppet":
  ensure  => present,
  path    => "c:/ProgramData/PuppetLabs/puppet/etc/puppet.conf",
  section => 'agent',
  setting => 'runinterval',
  value   => '30',
}