#
# Cookbook Name:: practicingruby
# Recipe:: god
#
# Installs and configures God
#

gem_package "god" do
  gem_binary node["practicingruby"]["ruby"]["gem"]["binary"]
  options    node["practicingruby"]["ruby"]["gem"]["options"]
  action     :install
end

# XXX: temporary hack to add god to PATH
execute "ln -snf /opt/rubies/#{node[:chruby][:default]}/bin/god /usr/local/bin/god"
