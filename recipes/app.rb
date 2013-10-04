#
# Cookbook Name:: practicingruby
# Recipe:: app
#

# Install JavaScript runtime for Rails app
package "nodejs"

# Install Pygments for syntax highlighting
package "python-pygments"

# Create deploy user first
include_recipe "practicingruby::deploy_user"

# Create config directory
config_dir = "/home/#{node["practicingruby"]["deploy"]["username"]}/shared"
directory config_dir do
  owner  node["practicingruby"]["deploy"]["username"]
  group  node["practicingruby"]["deploy"]["username"]
  mode   "2775"
  action :create
end
