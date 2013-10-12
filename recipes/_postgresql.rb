#
# Cookbook Name:: practicingruby
# Recipe:: postgresql
#
# Installs PostgreSQL and sets up databases
#

# Install PostgreSQL server and client
include_recipe "postgresql::server"
include_recipe "postgresql::client"

# Make database resource available
include_recipe "database::postgresql"

# Create databases for Rails app
node["practicingruby"]["database"].each do |name, info|
  next unless node["practicingruby"]["databases"][name] == true

  database name do
    connection(
      :host     => info["host"],
      :port     => node["postgresql"]["config"]["port"],
      :username => info["username"],
      :password => info["password"],
    )
    provider   Chef::Provider::Database::Postgresql
    action     :create
  end
end
