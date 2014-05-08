#
# Cookbook Name:: practicingruby
# Recipe:: apt
#
# Updates Debian package index
#

include_recipe "apt::default"

#
# XXX: work around bug in postgresql cookbook
# https://github.com/elm-city-craftworks/practicing-ruby-cookbook/issues/24
#
def apt_update?
  stamp_file = "/var/lib/apt/periodic/update-success-stamp"
  return true unless ::File.exist?(stamp_file)
  return true if ::File.exist?(stamp_file) && ::File.mtime(stamp_file) < Time.now - 86_400
  false
end

execute "apt-get update" do
  action :nothing
end.run_action(:run) if apt_update?
