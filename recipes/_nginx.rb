#
# Cookbook Name:: practicingruby
# Recipe:: nginx
#
# Installs and configures Nginx
#

# Override default Nginx attributes
node.set["nginx"]["worker_processes"]   = 4
node.set["nginx"]["worker_connections"] = 768

# Install Nginx and set up nginx.conf
include_recipe "nginx::default"

# Create practicingruby site config
template "#{node["nginx"]["dir"]}/sites-available/practicingruby" do
  source "practicingruby_nginx.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  action :create
end

# Enable practicingruby site
nginx_site "practicingruby" do
  enable true
end

# Disable default site
nginx_site "default" do
  enable false
end
