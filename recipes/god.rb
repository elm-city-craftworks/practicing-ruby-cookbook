#
# Cookbook Name:: practicingruby
# Recipe:: god
#
# Installs and configures God
#

gem_package "god" do
  gem_binary "/opt/rubies/#{node[:chruby][:default]}/bin/gem"
  options    "--no-ri --no-rdoc"
  action     :install
end

# XXX: temporary hack to add god to PATH
execute "ln -snf /opt/rubies/#{node[:chruby][:default]}/bin/god /usr/local/bin/god"
