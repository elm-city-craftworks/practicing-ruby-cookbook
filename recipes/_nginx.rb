#
# Cookbook Name:: practicingruby
# Recipe:: nginx
#
# Installs and configures Nginx
#

# Override default Nginx attributes
node.set["nginx"]["worker_processes"]     = 4
node.set["nginx"]["worker_connections"]   = 768
node.set["nginx"]["default_site_enabled"] = false

# Install Nginx and set up nginx.conf
include_recipe "nginx::default"

# Create SSL certificate file
file node["practicingruby"]["ssl"]["certificate_file"] do
  owner   "root"
  group   "root"
  mode    "0644"
  content node["practicingruby"]["ssl"]["certificate"]
  action  :create
end

# Create SSL private key file
file node["practicingruby"]["ssl"]["private_key_file"] do
  owner   "root"
  group   "root"
  mode    "0644"
  content node["practicingruby"]["ssl"]["private_key"]
  action  :create
end

# Create practicingruby site config
template "#{node["nginx"]["dir"]}/sites-available/practicingruby" do
  source "practicingruby_nginx.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  action :create
  variables(
    :ssl_certificate     => node["practicingruby"]["ssl"]["certificate_file"],
    :ssl_certificate_key => node["practicingruby"]["ssl"]["private_key_file"]
  )
end

# Enable practicingruby site
nginx_site "practicingruby" do
  enable true
end
