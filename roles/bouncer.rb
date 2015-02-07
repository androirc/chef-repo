name "bouncer"
description "Configure a node as a bouncing server"
run_list "recipe[madalynn::sshd]"
