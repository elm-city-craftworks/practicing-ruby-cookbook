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

# Start MailCatcher as mailcatcher::default doesn't do it for us
execute "start-mailcatcher" do
  command  "true"
  notifies :start, "service[mailcatcher]"
  not_if   "pgrep mailcatcher"
end
