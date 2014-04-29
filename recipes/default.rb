#
# Cookbook Name:: practicingruby
# Recipe:: default
#
# Sets up production-like environment for Practicing Ruby Rails app
#

# Include all the pieces
include_recipe "practicingruby::_apt"
include_recipe "practicingruby::_deploy_user"
include_recipe "practicingruby::_ruby"
include_recipe "practicingruby::_postgresql"
include_recipe "practicingruby::_nginx"
include_recipe "practicingruby::_unicorn"
include_recipe "practicingruby::_god"
include_recipe "practicingruby::_mailcatcher"
include_recipe "practicingruby::_rails"
