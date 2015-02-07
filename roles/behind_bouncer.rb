name "behind_bouncer"
description "Configure a node to be behind a bouncing server"
run_list "recipe[madalynn::sshd_listen_address]", "recipe[madalynn::sshd]"
