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

# XXX: install startup script & config
