#
# Cookbook Name:: mu
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "Update APT" do
  command "apt-get update"
end

['libgmime-2.6-dev', 'libxapian-dev', 'guile-2.0-dev', 'html2text', 'xdg-utils', 'guile-2.0-dev', 'html2text', 'xdg-utils' ].each do |pkg|
  package pkg do
    action :install
  end
end

localfile = Chef::Config[:file_cache_path] + "/mu.tar.gz"
remote_file localfile do
  source "http://mu0.googlecode.com/files/mu-0.9.8.5.tar.gz"
  mode "0644"
end

directory node["mu"]["build_dir"] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar" do
  cwd node['mu']['build_dir']
  command "tar --strip-components 1 -xzf " + localfile
end
