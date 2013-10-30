#
# Cookbook Name:: practicingruby
# Recipe:: ruby
#
# Installs Ruby and Bundler
#

ruby_version = node["practicingruby"]["ruby"]["version"]

# Override default chruby attributes
node.set["chruby"]["rubies"] = {
  "1.9.3-p392" => false,
  ruby_version => true
}
node.set["chruby"]["default"] = ruby_version

# Build and install Ruby version using chruby and ruby-build
include_recipe "chruby::system"

# The chruby cookbook installs /etc/profile.d/chruby.sh which sets up the Ruby
# environment. Unfortunately, that file will only be sourced after the next
# login, causing the first converge to fail. We can fix this by prepending our
# Ruby version to PATH.
ruby_block "add-ruby-to-path" do
  block do
    ENV["PATH"] = "/opt/rubies/#{ruby_version}/bin:#{ENV["PATH"]}"
  end
  not_if { ENV["PATH"].include? ruby_version }
end

# Update to the latest RubyGems version
execute "update-rubygems" do
  command "gem update --system"
  action  :run
  not_if  "gem list | grep -q rubygems-update"
end

# Install Bundler
gem_package "bundler"
