#
# Cookbook Name:: practicingruby
# Recipe:: mailcatcher
#
# Installs and starts MailCatcher
#

# Install Ruby first
include_recipe "practicingruby::_ruby"

# Install and start MailCatcher
include_recipe "mailcatcher::default"
