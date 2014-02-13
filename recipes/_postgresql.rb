#
# Cookbook Name:: practicingruby
# Recipe:: postgresql
#
# Installs PostgreSQL and creates database
#

db = node["practicingruby"]["database"]

# Install PostgreSQL server if database is local
include_recipe "postgresql::server" if db["host"] == "localhost"

# Install PostgreSQL client
include_recipe "postgresql::client"

# Make postgresql_database resource available
include_recipe "database::postgresql"

# Create database for Rails app
postgresql_database db["name"] do
  connection(
    :host     => db["host"],
    :port     => node["postgresql"]["config"]["port"],
    :username => db["username"],
    :password => db["password"]
  )
end
