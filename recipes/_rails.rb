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
shared_dir = File.join(node["practicingruby"]["deploy"]["home_dir"], "shared")
directory shared_dir do
  owner  node["practicingruby"]["deploy"]["username"]
  group  node["practicingruby"]["deploy"]["username"]
  mode   "2775"
  action :create
end

# Create environment configuration
template File.join(shared_dir, ".env") do
  source "env.sh.erb"
  owner  node["practicingruby"]["deploy"]["username"]
  group  node["practicingruby"]["deploy"]["username"]
  mode   "0644"
  action :create
  variables(
    :rails => node["practicingruby"]["rails"]
  )
end

# Create database configuration
template File.join(shared_dir, "database.yml") do
  owner  node["practicingruby"]["deploy"]["username"]
  group  node["practicingruby"]["deploy"]["username"]
  mode   "0644"
  action :create
  variables(
    :db => node["practicingruby"]["database"]
  )
end

# Create Unicorn startup script
template "/etc/init.d/unicorn" do
  source "unicorn.sh.erb"
  owner  "root"
  group  "root"
  mode   "0755"
  action :create
  variables(
    :deploy_root => File.join(node["practicingruby"]["deploy"]["home_dir"], "current")
  )
end

# Register Unicorn startup script
service "unicorn" do
  supports :restart => false, :status => false
  action   [:enable]
end
