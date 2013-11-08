#
# Cookbook Name:: practicingruby
# Recipe:: deploy_user
#
# Creates deployment user for Capistrano
#

# Create deploy user
user_account node["practicingruby"]["deploy"]["username"] do
  ssh_keys     node["practicingruby"]["deploy"]["ssh_keys"]
  ssh_keygen   false
end

# Configure sudo privileges
sudo node["practicingruby"]["deploy"]["username"] do
  user     node["practicingruby"]["deploy"]["username"]
  commands node["practicingruby"]["deploy"]["sudo_commands"]
  nopasswd true
end
