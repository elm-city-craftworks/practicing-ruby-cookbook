#
# Cookbook Name:: practicingruby
# Recipe:: ruby
#
# Installs Ruby and Bundler
#

# Override default chruby attributes
node.set["chruby"]["rubies"] = {
  "1.9.3-p392" => false,
  node["practicingruby"]["ruby"]["version"] => true
}
node.set["chruby"]["default"] = node["practicingruby"]["ruby"]["version"]

# Build and install Ruby versions using chruby und ruby-build
include_recipe "chruby::system"

# Update to the latest RubyGems version
execute "update-rubygems" do
  command "#{node["practicingruby"]["ruby"]["gem"]["binary"]} update --system"
  action :run
end

# Install Bundler
gem_package "bundler" do
  gem_binary node["practicingruby"]["ruby"]["gem"]["binary"]
  options    node["practicingruby"]["ruby"]["gem"]["options"]
  action     :install
end
