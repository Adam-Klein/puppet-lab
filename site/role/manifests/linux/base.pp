# linux base role
class role::linux::base {
  include profile::linux::base
  include profile::linux::files
  include profile::linux::groups
}
