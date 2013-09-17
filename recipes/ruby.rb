# Install ruby-build for rbenv_ruby LWRP
# https://github.com/fnichol/chef-ruby_build#-default
include_recipe "ruby_build"

# Install rbenv for system-wide use
# https://github.com/fnichol/chef-rbenv#-system_install
include_recipe "rbenv::system_install"

# Build and install Ruby version with ruby-build
# https://github.com/fnichol/chef-rbenv#-rbenv_ruby
rbenv_ruby node["practicingruby"]["ruby"]["version"]

# Set global version of Ruby to be used in all shells
# https://github.com/fnichol/chef-rbenv#-rbenv_global
rbenv_global node["practicingruby"]["ruby"]["version"]

# Install Ruby gems
# https://github.com/fnichol/chef-rbenv#-rbenv_gem
node["practicingruby"]["ruby"]["gems"].each do |gem|
  rbenv_gem gem["name"] do
    rbenv_version node["practicingruby"]["ruby"]["version"]
    version       gem["version"] unless gem["version"].nil?
    action        :install
  end
end
