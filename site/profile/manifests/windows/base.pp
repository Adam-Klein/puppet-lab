# windows base profile
class profile::windows::base {

  Exec { provider => 'powershell', }
  
  exec { 'enable rdp tcp':
    command  => 'Enable-NetFirewallRule -DisplayName "Remote Desktop - User Mode (TCP-In)"',
  }

  exec { 'enable rdp udp':
    command  => 'Enable-NetFirewallRule -DisplayName "Remote Desktop - User Mode (UDP-In)"',
  }

  ini_setting { 'runinterval':
    ensure  => present,
    path    => 'c:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
    section => 'agent',
    setting => 'runinterval',
    value   => '1800',
  }
}