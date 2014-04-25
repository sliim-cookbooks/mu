#
# Cookbook Name:: mu
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#TODO: Run this only on debian and derived distro
execute "Update APT" do
  command "apt-get update"
end

#TODO: Create and use emacs24 cookbook
package "emacs23-nox" do
  action :install
end

#TODO: Package name are different between distro
[ "libgmime-2.6-dev", "libxapian-dev", "guile-2.0-dev", "html2text", "xdg-utils", "guile-2.0-dev", "html2text", "xdg-utils", "g++", "libgtk2.0-dev" ].each do |pkg|
  package pkg do
    action :install
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

execute "install" do
  cwd node["mu"]["build_dir"]
  command "sudo make install"
end
