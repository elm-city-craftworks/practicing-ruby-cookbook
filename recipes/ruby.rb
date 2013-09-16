#
# Cookbook Name:: practicing-ruby
# Recipe:: ruby
#
# Copyright (C) 2013 Mathias Lafeldt <mathias.lafeldt@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'ruby_build'
include_recipe 'rbenv::system'

# The rbenv cookbook installs /etc/profile.d/rbenv.sh which sets up the Ruby
# environment. But that file will only be sourced after the next login,
# causing the first converge to fail. With this workaround, rbenv will be
# available immediately.
ruby_block "Add rbenv to PATH" do
  block do
    rbenv_root = node['rbenv']['root_path']
    ENV['PATH'] = "#{rbenv_root}/shims:#{rbenv_root}/bin:#{ENV['PATH']}"
  end
end
