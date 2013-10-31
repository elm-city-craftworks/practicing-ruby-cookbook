#
# Cookbook Name:: practicingruby
# Recipe:: production
#
# Sets up production environment for Practicing Ruby Rails app
#

# Update Debian package index
include_recipe "apt::default"

# Include all the pieces
include_recipe "practicingruby::_deploy_user"
include_recipe "practicingruby::_ruby"
include_recipe "practicingruby::_postgresql"
include_recipe "practicingruby::_nginx"
include_recipe "practicingruby::_god"
include_recipe "practicingruby::_mailcatcher"
include_recipe "practicingruby::_rails"
