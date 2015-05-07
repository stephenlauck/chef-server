#
# Cookbook Name:: chef-server
# Attributes:: default
#
# Copyright:: Copyright (c) 2012-2015 Chef Software, Inc.
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
#
default['chef-server']['version'] = nil

# The Chef Server must have an API FQDN set.
# Ref. http://docs.chef.io/install_server_pre.html#hostnames
default['chef-server']['api_fqdn'] = node['fqdn']

default['chef-server']['addons'] = []

# set Chef server topology 
# for example standalone or tiered
default['chef-server']['topology'] = "standalone"

# if topology is tier, list of servers
# [
#   {
#     :fqdn => node['fqdn'],
#     :ipaddress => node['ipaddress'],
#     :bootstrap => true,
#     :role => 'backend'
#   }
# ]
default['chef-server']['servers'] = []

#
# Chef Server Tunables
#
# For a complete list see:
# http://docs.chef.io/server/config_rb_server.html
#
# Example:
#
# In a recipe:
#
#     node.override['chef-server']['configuration']['nginx']['ssl_port'] = 4433
#
# In a role:
#
#     default_attributes(
#       'chef-server' => {
#         'configuration' => {
#           'nginx' => {
#             'ssl_port' => 4433
#           }
#         }
#       }
#     )
#
default['chef-server']['configuration'] = {}
