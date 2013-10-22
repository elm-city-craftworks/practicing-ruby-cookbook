#
# Cookbook Name:: practicingruby
# Recipe:: rails
#
# Prepares configuration of Rails app for Capistrano
#

# Install JavaScript runtime for Rails app
package "nodejs"

# Install Pygments for syntax highlighting
package "python-pygments"

# Create deploy user first
include_recipe "practicingruby::_deploy_user"

# Create shared directory that will be used by Capistrano
shared_dir = File.join(node["practicingruby"]["deploy"]["home_dir"], "shared")
directory shared_dir do
  owner  node["practicingruby"]["deploy"]["username"]
  group  node["practicingruby"]["deploy"]["username"]
  mode   "2775"
  action :create
end

# Create config files for Rails app in shared directory
%w(cache_cooker_settings.rb
   domain_settings.rb
   database.yml
   mailchimp_settings.rb
   mixpanel.rb
   omniauth.rb
   secret_token.rb
   stripe.rb
).each do |file|
  template File.join(shared_dir, file) do
    owner  node["practicingruby"]["deploy"]["username"]
    group  node["practicingruby"]["deploy"]["username"]
    mode   "0644"
    action :create
    variables(
      :rails => node["practicingruby"]["rails"]
    )
  end
end
