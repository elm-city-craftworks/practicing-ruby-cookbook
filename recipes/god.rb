#
# Cookbook Name:: practicingruby
# Recipe:: god
#
# Installs God
#

# Install Ruby first
include_recipe "practicingruby::ruby"

# Install god gem
gem_package "god" do
  gem_binary node["practicingruby"]["ruby"]["gem"]["binary"]
  options    node["practicingruby"]["ruby"]["gem"]["options"]
  action     :install
end

# HACK: allow to run god via sudo
link "/usr/local/bin/god" do
  to        "/opt/rubies/#{node["practicingruby"]["ruby"]["version"]}/bin/god"
  link_type :symbolic
  action    :create
end
