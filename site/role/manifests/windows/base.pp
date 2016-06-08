# windows base role
class role::windows::base {
  include profile::windows::base
  include profile::snare::client
}