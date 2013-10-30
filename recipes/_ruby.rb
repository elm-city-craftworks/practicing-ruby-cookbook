#
# Cookbook Name:: practicingruby
# Recipe:: ruby
#
# Installs Ruby and Bundler
#

# Install ruby-build
include_recipe "ruby_build"

# Build and install Ruby version using ruby-build
ruby_build_ruby node["practicingruby"]["ruby"]["version"] do
  prefix_path "/usr/local"
  action      :install
end

# Update to the latest RubyGems version
execute "update-rubygems" do
  command "gem update --system"
  action  :run
  not_if  "gem list | grep -q rubygems-update"
end

# Install Bundler
gem_package "bundler"
