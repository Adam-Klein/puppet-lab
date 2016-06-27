# windows base role
class role::windows::base {
  include profile::base
  include profile::windows::base
}
