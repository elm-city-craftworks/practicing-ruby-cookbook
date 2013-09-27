#
# Cookbook Name:: practicingruby
# Recipe:: postgresql
#

include_recipe "openssl"
include_recipe "postgresql::server"
include_recipe "postgresql::client"
