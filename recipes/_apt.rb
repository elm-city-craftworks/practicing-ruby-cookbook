#
# Cookbook Name:: practicingruby
# Recipe:: apt
#
# Updates Debian package index
#

include_recipe "apt::default"

# XXX: work around bug in postgresql cookbook
# https://github.com/elm-city-craftworks/practicing-ruby-cookbook/issues/24
stamp_file = "/var/lib/apt/periodic/update-success-stamp"
execute "apt-get update" do
  action :nothing
end.run_action(:run) unless ::File.exist?(stamp_file) &&
                            ::File.mtime(stamp_file) < Time.now - 86_400
