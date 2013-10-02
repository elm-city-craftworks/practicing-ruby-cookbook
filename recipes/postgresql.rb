#
# Cookbook Name:: practicingruby
# Recipe:: postgresql
#
# Installs PostgreSQL server and client
#

include_recipe "postgresql::server"
include_recipe "postgresql::client"
