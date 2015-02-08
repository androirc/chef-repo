name "default"
description "Default configuration of a node"
run_list "recipe[chef-client]", "recipe[chef-vault]", "recipe[madalynn::users]"
