#
# Cookbook Name:: practicingruby
# Attributes:: default
#

# Ruby version to install
default["practicingruby"]["ruby"]["version"] = "2.0.0-p353"

# PostgreSQL database to create
default["practicingruby"]["database"]["name"]      = "practicing-ruby-production"
default["practicingruby"]["database"]["host"]      = "localhost"
default["practicingruby"]["database"]["username"]  = "postgres"
default["practicingruby"]["database"]["password"]  = "practicingruby"
default["practicingruby"]["database"]["rails_env"] = "production"

# Deployment user for Capistrano
default["practicingruby"]["deploy"]["username"]      = "deploy"
default["practicingruby"]["deploy"]["ssh_keys"]      = []
default["practicingruby"]["deploy"]["sudo_commands"] = ["/usr/local/bin/god"]
default["practicingruby"]["deploy"]["home_dir"]      = "/home/#{node["practicingruby"]["deploy"]["username"]}"

# Rails app settings
default["practicingruby"]["rails"]["secret_token"]              = "3f8e352c942d04b489795f5a9fe464c0"
default["practicingruby"]["rails"]["host"]                      = "practicingruby.local"

default["practicingruby"]["rails"]["cachecooker"]["base_uri"]   = "http://practicingruby.local"
default["practicingruby"]["rails"]["cachecooker"]["password"]   = "supersecret"
default["practicingruby"]["rails"]["cachecooker"]["realm"]      = "Practicing Ruby"
default["practicingruby"]["rails"]["cachecooker"]["username"]   = "cachecooker"

default["practicingruby"]["rails"]["mailchimp"]["api_key"]      = "YOUR-API-KEY"
default["practicingruby"]["rails"]["mailchimp"]["list_id"]      = "YOUR-LIST-ID"
default["practicingruby"]["rails"]["mailchimp"]["sender_email"] = "Your Sender Email"
default["practicingruby"]["rails"]["mailchimp"]["sender_name"]  = "Your Sender Name"
default["practicingruby"]["rails"]["mailchimp"]["testers"]      = ["your@email.com"]
default["practicingruby"]["rails"]["mailchimp"]["webhook_key"]  = "Your/webhook/key"

default["practicingruby"]["rails"]["stripe"]["publishable_key"] = "PUBLISHABLE"
default["practicingruby"]["rails"]["stripe"]["secret_key"]      = "SECRET"
default["practicingruby"]["rails"]["stripe"]["webhook_path"]    = "/oh/yeah/stripe/webhooks"
