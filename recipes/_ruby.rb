#
# Cookbook Name:: practicingruby
# Recipe:: ruby
#
# Installs Ruby and Bundler
#

# Add APT repository that provides the Ruby packages we need
apt_repository "brightbox-ruby" do
  uri          "http://ppa.launchpad.net/brightbox/ruby-ng-experimental/ubuntu"
  distribution node["lsb"]["codename"]
  arch         node["kernel"]["machine"] == "x86_64" ? "amd64" : "i386"
  components   ["main"]
  keyserver    "keyserver.ubuntu.com"
  key          "c3173aa6"
end

# Install Ruby and dependencies
ruby_version = node["practicingruby"]["ruby"]["version"]
package "ruby#{ruby_version}"
package "ruby#{ruby_version}-dev"

# Configure RubyGems to not install gem docs
file "/etc/gemrc" do
  owner   "root"
  group   "root"
  mode    "0644"
  content "gem: --no-document\n"
end

# Install Bundler
gem_package "bundler"
