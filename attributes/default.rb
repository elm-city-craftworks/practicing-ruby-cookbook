#
# Cookbook Name:: practicingruby
# Attributes:: default
#

# Ruby version to install
default["practicingruby"]["ruby"]["version"] = "2.0.0-p247"

# Defaults for gem_package resource
default["practicingruby"]["ruby"]["gem"]["binary"]  = "/opt/rubies/#{node["practicingruby"]["ruby"]["version"]}/bin/gem"
default["practicingruby"]["ruby"]["gem"]["options"] = "--no-ri --no-rdoc"

# Deployment user
default["practicingruby"]["deploy"]["username"]      = "deploy"
default["practicingruby"]["deploy"]["ssh_keys"]      = []
default["practicingruby"]["deploy"]["sudo_commands"] = ["/usr/local/bin/god"]
