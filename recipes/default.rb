#
# Cookbook Name:: practicingruby
# Recipe:: default
#

include_recipe "apt::default"
include_recipe "practicingruby::ruby"
include_recipe "practicingruby::postgresql"
include_recipe "practicingruby::app"
include_recipe "practicingruby::god"
