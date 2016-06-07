node 'master' {
  include ::pe_repo::platform::windows_x86_64
}

node 'pe_agent.corp.standard.com' {

}

node 'wagent' {
  include role::windows::base
}
