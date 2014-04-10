# vi: set ft=ruby :
#
# Berkshelf will make all cookbooks in this file and their dependencies
# automatically available to Vagrant when creating or provisioning a VM.
# Berkshelf is very similar to Bundler, only that it manages cookbooks instead
# of gems.
#

site :opscode

# Tell Berkshelf to read cookbook dependencies from metadata.rb
metadata

# Get mailcatcher cookbook from GitHub
cookbook "mailcatcher", :github => "andruby/mailcatcher", :ref => "v0.3.0"
