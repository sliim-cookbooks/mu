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
