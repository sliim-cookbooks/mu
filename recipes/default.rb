#
# Cookbook Name:: mu
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

case node["mu"]["emacs_package"]
when false
  package node["mu"]["emacs_package"] do
    action :install
  end
end

node["mu"]["packages"].each do |pkg|
  package pkg do
    action :upgrade
  end
end

localfile = Chef::Config[:file_cache_path] + "/mu.tar.gz"
remote_file localfile do
  source "http://mu0.googlecode.com/files/mu-" + node["mu"]["version"] + ".tar.gz"
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
  cwd node["mu"]["build_dir"]
  command "tar --strip-components 1 -xzf " + localfile
end

execute "configure and make" do
  cwd node["mu"]["build_dir"]
  command "./configure && make"
end

execute "Install mu" do
  cwd node["mu"]["build_dir"]
  command "sudo make install"
end
