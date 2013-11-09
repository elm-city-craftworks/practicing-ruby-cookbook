#
# Cookbook Name:: practicingruby
# Recipe:: rails
#
# Prepares configuration of Rails app for Capistrano
#

# Install JavaScript runtime for Rails app
package "nodejs"

# Install Pygments for syntax highlighting
package "python-pygments"

# Create deploy user first
include_recipe "practicingruby::_deploy_user"

# Create shared directory that will be used by Capistrano
shared_dir = ::File.join(node["practicingruby"]["deploy"]["home_dir"], "shared")
directory shared_dir do
  owner node["practicingruby"]["deploy"]["username"]
  group node["practicingruby"]["deploy"]["username"]
  mode  "2775"
end

# Create environment configuration
template ::File.join(shared_dir, ".env") do
  source "env.sh.erb"
  owner  node["practicingruby"]["deploy"]["username"]
  group  node["practicingruby"]["deploy"]["username"]
  mode   "0644"
  variables(:rails => node["practicingruby"]["rails"])
end

# Create database configuration
template ::File.join(shared_dir, "database.yml") do
  owner node["practicingruby"]["deploy"]["username"]
  group node["practicingruby"]["deploy"]["username"]
  mode  "0644"
  variables(:db => node["practicingruby"]["database"])
end
