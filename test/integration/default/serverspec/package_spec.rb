# -*- coding: utf-8 -*-

require 'serverspec'
set :backend, :exec

describe package('maildir-utils') do
  it { should be_installed }
end

describe package('mu4e') do
  it { should be_installed }
end
