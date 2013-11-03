#
# Cookbook Name:: practicingruby
# Recipe:: unicorn
#
# Installs upstart script for Unicorn
#

template "/etc/init/unicorn.conf" do
  source "unicorn.upstart.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  action :create
  variables(
    :deploy_user => node["practicingruby"]["deploy"]["username"],
    :deploy_dir  => File.join(node["practicingruby"]["deploy"]["home_dir"], "current")
  )
end

# Unicorn is usually started by Capistrano and we only have to make sure that
# it is also started when booting.
service "unicorn" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true
  action   [:enable]
end
