node 'master' {
  include ::pe_repo::platform::windows_x86_64
}

node 'pe_agent.corp.standard.com' {
  include role::base
}

node 'wagent' {

}
