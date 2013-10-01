#
# Cookbook Name:: practicingruby
# Recipe:: god
#
# Installs and configures God
#

rbenv_gem "god" do
  rbenv_version node["practicingruby"]["ruby"]["version"]
  action        :install
end

# XXX: install startup script & config
