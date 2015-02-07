#
# Cookbook Name:: madalynn
# Recipe:: sshd_listen_address
#
# Copyright 2015, Madalynn
#
# All rights reserved - Do Not Redistribute
#

# Change sshd ListenAddress to listen on private ip (eth1)

ip = node[:network][:interfaces][:eth0][:addresses].detect{ |k, v| v[:family] == "inet" }.first
node.override['sshd']['sshd_config']['ListenAddress'] = [ip, '0.0.0.0']
