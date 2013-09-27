#
# Cookbook Name:: practicingruby
# Recipe:: app
#

# JavaScript runtime for Rails app
package "nodejs"
# For syntax highlighting
package "python-pygments"

# Deploy Practicing Ruby Rails app
application "practicingruby" do
  path       node["practicingruby"]["app"]["path"]
  repository node["practicingruby"]["app"]["repository"]
  revision   node["practicingruby"]["app"]["revision"]

  rails do
  end
end
