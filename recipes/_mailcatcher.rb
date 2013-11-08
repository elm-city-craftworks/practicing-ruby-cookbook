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
bash "start-mailcatcher" do
  code     "true"
  notifies :start, "service[mailcatcher]"
  not_if   "pgrep mailcatcher"
end
