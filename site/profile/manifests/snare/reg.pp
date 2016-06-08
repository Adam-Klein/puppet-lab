# this class manages the registry keys for SNARE client
class profile::snare::reg {
  $hklm_base    = 'HKLM\Software\InterSect Alliance'
  $hklm_audit   = "${hklm_base}\\AuditService"
  $hklm_config  = "${hklm_audit}\\Config"
  $hklm_network = "${hklm_audit}\\Network"
  $hklm_objective  = "${hklm_audit}\\Objective"
  $hklm_remote  = "${hklm_audit}\\Remote"
  $hklm_status  = "${hklm_audit}\\Status"

  $keys = [ $hklm_base, $hklm_audit, $hklm_config, $hklm_network, $hklm_remote ]
  registry_key { $keys:
    ensure => present,
  }

  registry_key { $hklm_objective:
    ensure       => present,
    purge_values => true,
  }

  registry_value { "${hklm_config}\\LicenseKey":
    ensure => present,
    type   => string,
    data   => '2014-12-17',
  }
  registry_value { "${hklm_config}\\Audit":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\Checksum":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\CritAudit":
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }
  registry_value { "${hklm_config}\\Delimiter":
    ensure => present,
    type   => string,
    data   => '	',
  }
  registry_value { "${hklm_config}\\EnableUSB":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\FileAudit":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\FileExport":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\HeartBeat":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\AgentLog":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\UseUTC":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\ClearTabs":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\LeaveRetention":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\OutputFilePath":
    ensure => present,
    type   => string,
    data   => '',
  }
  registry_value { "${hklm_config}\\CtirAudit":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_config}\\@":
    ensure => present,
    type   => string,
    data   => '1',
  }

  registry_value { "${hklm_network}\\CacheSizeM":
    ensure => present,
    type   => dword,
    data   => 0x00000005,
  }
  registry_value { "${hklm_network}\\CacheSizeSet":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_network}\\EncryptMsg":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_network}\\SocketType":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_network}\\Destination":
    ensure => present,
    type   => string,
    data   => '192.168.137.95',
  }
  registry_value { "${hklm_network}\\DestPort":
    ensure => present,
    type   => dword,
    data   => 0x00000202,
  }
  registry_value { "${hklm_network}\\Syslog":
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }
  registry_value { "${hklm_network}\\SyslogAlt":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_network}\\SyslogDest":
    ensure => present,
    type   => dword,
    data   => 0x000000b6,
  }
  registry_value { "${hklm_network}\\SyslogDynamicCritic":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_network}\\NotifyMsgLimit":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_network}\\NotifyMsgLimitFrequency":
    ensure => present,
    type   => dword,
    data   => 0x0000003c,
  }
  registry_value { "${hklm_network}\\RateLimit":
    ensure => present,
    type   => dword,
    data   => 0x00002710,
  }
  registry_value { "${hklm_network}\\TruncateList":
    ensure => present,
    type   => string,
    data   => '',
  }
  registry_value { "${hklm_network}\\@":
    ensure => present,
    type   => string,
    data   => '',
  }
  registry_value { "${hklm_network}\\SyslogDynamicCtiric":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }

  registry_value { "${hklm_objective}\\Objective1":
    ensure => present,
    type   => string,
    data   => "1	255	255	*	***	0	*	0	0	*	0	0",
  }

  registry_value { "${hklm_remote}\\Allow":
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }
  registry_value { "${hklm_remote}\\WebPort":
    ensure => present,
    type   => dword,
    data   => 0x00001811,
  }
  registry_value { "${hklm_remote}\\WebPortChange":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_remote}\\Restrict":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_remote}\\RestrictIP":
    ensure => present,
    type   => string,
    data   => '127.0.0.1',
  }
  registry_value { "${hklm_remote}\\AccessKey":
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }
  registry_value { "${hklm_remote}\\AccessKeySet":
    ensure => present,
    type   => string,
    data   => '276a188ea215b8e8ff276294cbde9bf2',
  }
  registry_value { "${hklm_remote}\\AccessKeySetSnare1":
    ensure => present,
    type   => string,
    data   => '3d421f78474b37303d2fd4be9cbf0927',
  }
  registry_value { "${hklm_remote}\\AccessKeySetSnare2":
    ensure => present,
    type   => string,
    data   => 'dd9bf01285f25fa60fcf07501f89accd',
  }
  registry_value { "${hklm_remote}\\AccessKeySetSnare3":
    ensure => present,
    type   => string,
    data   => 'e8cca5770f356d9f281e1d92cc693760',
  }
  registry_value { "${hklm_remote}\\AllowBasicAuth":
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }
  registry_value { "${hklm_remote}\\EnableCookies":
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }

  registry_value { "${hklm_status}\\LOG_TYPE_APPLICATION":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Application' RecordId='3810' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_SECURITY":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Security' RecordId='13597356' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_SYSTEM":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='System' RecordId='20751' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_DS":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_status}\\LOG_TYPE_DNS":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_status}\\LOG_TYPE_FRS":
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
  registry_value { "${hklm_status}\\LOG_TYPE_MICROSOFT-WINDOWS-WINRM/OPERATIONAL":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Microsoft-Windows-WinRM/Operational' RecordId='219' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_MICROSOFT-WINDOWS-BITS-CLIENT/OPERATIONAL":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Microsoft-Windows-Bits-Client/Operational' RecordId='3175' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_MICROSOFT-WINDOWS-DIAGNOSIS-DPS/OPERATIONAL":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Microsoft-Windows-Diagnosis-DPS/Operational' RecordId='126' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_MICROSOFT-WINDOWS-RESOURCE-EXHAUSTION-DETECTOR/OPERATIONAL":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Microsoft-Windows-Resource-Exhaustion-Detector/Operational' RecordId='108' IsCurrent='true'/>

</BookmarkList>",
  }
  registry_value { "${hklm_status}\\LOG_TYPE_MICROSOFT-WINDOWS-WINDOWSUPDATECLIENT/OPERATIONAL":
    ensure => present,
    type   => string,
    data   => "<BookmarkList>

  <Bookmark Channel='Microsoft-Windows-WindowsUpdateClient/Operational' RecordId='2897' IsCurrent='true'/>

</BookmarkList>",
  }
}
