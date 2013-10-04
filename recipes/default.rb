#
# Cookbook Name:: practicingruby
# Recipe:: default
#
# Sets up environment for Practicing Ruby Rails app
#

# Update Debian package index
include_recipe "apt::default"

# Include all the pieces
include_recipe "practicingruby::deploy_user"
include_recipe "practicingruby::ruby"
include_recipe "practicingruby::postgresql"
include_recipe "practicingruby::god"
include_recipe "practicingruby::app"
