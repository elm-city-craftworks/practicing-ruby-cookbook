#
# Cookbook Name:: practicingruby
# Recipe:: deploy_user
#
# Creates deploy user with limited sudo privileges
#

# Create deploy user
user_account node["practicingruby"]["deploy"]["username"] do
  manage_home  true
  create_group true
  ssh_keys     node["practicingruby"]["deploy"]["ssh_keys"]
  ssh_keygen   false
  action       :create
end

# Configure sudo privileges
sudo node["practicingruby"]["deploy"]["username"] do
  user     node["practicingruby"]["deploy"]["username"]
  commands node["practicingruby"]["deploy"]["sudo_commands"]
  nopasswd true
  action   :install
end
