#
# Cookbook Name:: practicingruby
# Recipe:: ruby
#
# Installs Ruby and gems with ruby-build and rbenv
#
# The used recipes and LWRPs are documented here:
#
# - https://github.com/fnichol/chef-ruby_build#readme
# - https://github.com/fnichol/chef-rbenv#readme
#

# Install ruby-build for rbenv_ruby LWRP
include_recipe "ruby_build"

# Install rbenv for system-wide use
include_recipe "rbenv::system_install"

# Build and install Ruby version with ruby-build, and make it the global
# version to be used in all shells
ruby_version = node["practicingruby"]["ruby"]["version"]
rbenv_ruby ruby_version
rbenv_global ruby_version

# Install Ruby gems into global Ruby version
node["practicingruby"]["ruby"]["gems"].each do |gem|
  rbenv_gem gem["name"] do
    rbenv_version ruby_version
    version       gem["version"] unless gem["version"].nil?
    action        :install
  end
end
