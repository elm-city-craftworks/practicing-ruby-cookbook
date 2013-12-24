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
  owner "root"
  group "root"
  mode  "0755"
end

# Create god config file
file "/etc/god/master.conf" do
  owner    "root"
  group    "root"
  mode     "0644"
  notifies :restart, "service[god]"

  home     = node["practicingruby"]["deploy"]["home_dir"]
  god_file = "#{home}/current/config/delayed_job.god"

  content "God.load('#{god_file}') if File.file?('#{god_file}')\n"
end

# Install startup script
cookbook_file "/etc/init/god.conf" do
  source "god.upstart"
  owner  "root"
  group  "root"
  mode   "0644"
end

# Start god
service "god" do
  provider Chef::Provider::Service::Upstart
  action   [:enable, :start]
end
