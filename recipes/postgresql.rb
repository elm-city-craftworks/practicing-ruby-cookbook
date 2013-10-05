#
# Cookbook Name:: practicingruby
# Recipe:: postgresql
#
# Installs PostgreSQL server and client
#

# Install PostgreSQL server and client
include_recipe "postgresql::server"
include_recipe "postgresql::client"

# Include postgresql_database
include_recipe "database::postgresql"

# Create production database
postgresql_connection_info = {
  :host     => "127.0.0.1",
  :port     => node["postgresql"]["config"]["port"],
  :username => "postgres",
  :password => node["postgresql"]["password"]["postgres"]
}
postgresql_database "practicing-ruby-production" do
  connection postgresql_connection_info
  action     :create
end
