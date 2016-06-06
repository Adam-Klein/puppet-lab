class { 'r10k':
  sources => {
    'default' => {
      'remote'  => '/vagrant',
      'basedir' => "/etc/puppetlabs/code/environments",
    },
  },
  configfile => '/etc/puppetlabs/r10k/r10k.yaml',
}

class { 'hiera':
  hierarchy => [
    'nodes/%{clientcert}',
    'app_tier/%{app_tier}',
    'common',
  ],
  datadir   => '/vagrant/hieradata',
}

