# base role
class role::base {
  include profile::base
  include profile::files
  include profile::groups
}
