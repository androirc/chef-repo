name "default"
description "Default configuration of a node"
run_list "recipe[chef-client::config]", "recipe[chef-client::service]", "recipe[chef-vault]", "recipe[madalynn::users]", "recipe[unattended-upgrades]"
default_attributes(
  "authorization" => {
      "sudo" => {
            "groups" => ["admin", "sudo"],
            "users" => ["root"],
            "passwordless" => false,
            "include_sudoers_d" => true,
            "sudoers_defaults" => [
              'env_reset',
              'mail_badpass',
              'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
            ]
          }
    }
)
