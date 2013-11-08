#
# Cookbook Name:: practicingruby
# Recipe:: ruby
#
# Installs Ruby and Bundler
#

# Install ruby-build
include_recipe "ruby_build"

# Build and install Ruby version using ruby-build. By installing it to
# /usr/local, we ensure it is the new global Ruby version from now on.
ruby_build_ruby node["practicingruby"]["ruby"]["version"] do
  prefix_path "/usr/local"
  action      :install
end

# Update to the latest RubyGems version
bash "update-rubygems" do
  code   "gem update --system"
  not_if "gem list | grep -q rubygems-update"
end

# Install Bundler
gem_package "bundler"
