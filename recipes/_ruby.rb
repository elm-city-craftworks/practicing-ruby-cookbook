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
package "ruby-switch"

# Switch to using new Ruby version from now on
bash "switch-ruby" do
  code   "ruby-switch --set ruby#{ruby_version}"
  not_if "ruby-switch --check | grep -q ruby#{ruby_version}"
end

# Install Bundler
gem_package "bundler"
