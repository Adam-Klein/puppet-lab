# this class downloads, installs, and configures SNARE client
# c.f. profile::snare::reg for windows registry keys
class profile::snare::client {
  # -- variables --
  $dest_base = 'c:\tmp'
  $filename  = 'Snare_4.2.7.zip'
  $url = 'http://pdxlltstd004.standard.com:8081/nexus/content/repositories/thirdparty/slalom/snare/4.2.7/snare-4.2.7.zip'
  $snare_exe = 'SnareEnterpriseAgent-Windows-v4.2.7-SUPP-MultiArch.exe'

  # -- resources --
  file { "${dest_base}/snare":
    ensure => directory,
  }

  archive { "${dest_base}/${filename}":
    ensure  => present,
    source  => $url,
    cleanup => true,
    creates => "${dest_base}/snare/${snare_exe}",
    require => File["${dest_base}/snare"],
  }

  $unzip_args =  {
    zip_path     => "${dest_base}/${filename}",
    extract_path => "${dest_base}/snare"
  }

  # TODO: we should probably turn this in to a defined type for re-use
  exec { 'unzip_snare':
    provider => powershell,
    command  => epp('profile/unzip_ps.epp', $unzip_args),
    creates  => "${dest_base}/snare/${snare_exe}",
    require  => Archive["${dest_base}/${filename}"],
  }

  exec { 'install_snare':
    path    => 'C:/Windows/System32',
    cwd     => "${dest_base}/snare",
    command => "cmd.exe /c .\\${snare_exe} /SP- /VERYSILENT /NOCANCEL /NORESTART /CLOSEAPPLICATIONS",
    creates => 'C:/Program Files/Snare/SnareCore.exe',
    require => Exec['unzip_snare'],
    before  => Class[profile::snare::reg],
  }

  contain profile::snare::reg

  service { 'snare':
    ensure    => running,
    enable    => true,
    subscribe => [
      Exec['install_snare'],
      Class[profile::snare::reg]
    ],
  }
}
