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

node['mu']['compile']['packages'].each do |pkg|
  package pkg
end

git node['mu']['compile']['build_dir'] do
  repository node['mu']['compile']['git-repository']
  reference node['mu']['compile']['git-reference']
end

execute 'autoreconf -i' do
  cwd node['mu']['compile']['build_dir']
end

execute 'build-mu' do
  cwd node['mu']['compile']['build_dir']
  command "./configure #{node['mu']['compile']['flags'].join(' ')}&& make"
end

execute 'make install' do
  cwd node['mu']['compile']['build_dir']
end

execute 'make-install-mu4e' do
  cwd "#{node['mu']['compile']['build_dir']}/mu4e"
  command 'make install'
end
