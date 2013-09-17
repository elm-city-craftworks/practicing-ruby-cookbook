#
# Cookbook Name:: practicingruby
# Attributes:: default
#

# Ruby version to install system-wide
default["practicingruby"]["ruby"]["version"] = "2.0.0-p247"

# List of Ruby gems to install
# :name is the name of the gem to install
# :version optionally defines a specific version of the gem
default["practicingruby"]["ruby"]["gems"] = [{ :name => "bundler" }]
