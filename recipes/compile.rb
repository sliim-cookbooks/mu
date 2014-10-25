# -*- coding: utf-8 -*-
#
# Cookbook Name:: mu
# Recipe:: compile
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt'

node['mu']['compile']['packages'].each do |pkg|
  package pkg
end

remotefile = 'http://mu0.googlecode.com/files/mu-'
remotefile << node['mu']['compile']['version'] << '.tar.gz'
localfile = Chef::Config[:file_cache_path] + '/mu.tar.gz'

remote_file localfile do
  source remotefile
  mode '0644'
end

directory node['mu']['compile']['build_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

execute 'untar' do
  cwd node['mu']['compile']['build_dir']
  command 'tar --strip-components 1 -xzf ' + localfile
end

execute 'configure and make' do
  cwd node['mu']['compile']['build_dir']
  command './configure && make'
end

execute 'install mu' do
  cwd node['mu']['compile']['build_dir']
  command 'make install'
end
