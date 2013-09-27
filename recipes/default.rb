#
# Cookbook Name:: practicingruby
# Recipe:: default
#

include_recipe "practicingruby::ruby"
include_recipe "practicingruby::postgresql"
include_recipe "practicingruby::app"
