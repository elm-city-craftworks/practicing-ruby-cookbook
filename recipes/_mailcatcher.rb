#
# Cookbook Name:: practicingruby
# Recipe:: mailcatcher
#
# Installs and starts MailCatcher
#

# Install Ruby first
include_recipe "practicingruby::_ruby"

# Install MailCatcher
include_recipe "mailcatcher::default"

# Start MailCatcher as mailcatcher::default doesn't do it by default
service "mailcatcher" do
  action :start
end
