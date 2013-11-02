#
# Cookbook Name:: practicingruby
# Recipe:: postgresql
#
# Installs PostgreSQL and creates database
#

# Install PostgreSQL server and client
include_recipe "postgresql::server"
include_recipe "postgresql::client"

# Make postgresql_database resource available
include_recipe "database::postgresql"

# Create database for Rails app
db = node["practicingruby"]["database"]
postgresql_database db["name"] do
  connection(
    :host     => db["host"],
    :port     => node["postgresql"]["config"]["port"],
    :username => db["username"],
    :password => db["password"],
  )
  action     :create
end
