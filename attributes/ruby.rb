#
# Cookbook Name:: practicing-ruby
# Attributes:: ruby
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

# Global Ruby version to install
ruby_version = '2.0.0-p247'
# All available Ruby versions
ruby_versions = [ruby_version]

set['rbenv']['global'] = ruby_version
set['rbenv']['rubies'] = ruby_versions

# Install gems for all Ruby versions
ruby_versions.each do |version|
  set['rbenv']['gems'][version] = [{'name' => 'bundler'}]
end
