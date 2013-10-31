#
# Cookbook Name:: practicingruby
# Recipe:: god
#
# Installs, configures, and starts God
#

# Install Ruby first
include_recipe "practicingruby::_ruby"

# Install god gem
gem_package "god"

# Create config directory
directory "/etc/god" do
  owner  "root"
  group  "root"
  mode   "0755"
  action :create
end

# Create config file
template "/etc/god/master.conf" do
  source   "god.conf.erb"
  owner    "root"
  group    "root"
  mode     "0644"
  action   :create
  notifies :restart, "service[god]"
  variables(
    :god_file => "#{node["practicingruby"]["deploy"]["home_dir"]}/current/config/delayed_job.god"
  )
end

# Install startup script
template "/etc/init.d/god" do
  source "god.sh.erb"
  owner  "root"
  group  "root"
  mode   "0755"
  action :create
  variables(
    :ruby_version => node["practicingruby"]["ruby"]["version"]
  )
end

# Start god
service "god" do
  supports :status => true, :restart => true
  action   [:enable, :start]
end
