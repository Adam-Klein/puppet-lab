# Global parameters file
class profile::params {
  case $::osfamily {
    'RedHat': {
      $puppetconfpath = '/etc/puppetlabs/puppet/puppet.conf'
    }
    'windows': {
      $puppetconfpath = 'C:\ProgramData\PuppetLabs\Puppet\Puppet.conf'
    }
    default: {
      fail('osfamily not supported')
    }
  }
}
