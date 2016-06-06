node 'master' {

}

node 'pe_agent.corp.standard.com' {
  include role::base
}

node 'wagent' {

}
