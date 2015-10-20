# -*- coding: utf-8 -*-

require 'serverspec'
set :backend, :exec

describe file('/usr/local/bin/mu') do
  it { should be_file }
  it { should be_executable }
end

describe command 'mu --version' do
  its(:stdout) { should match(/version 0.9.13/) }
end

describe file '/usr/local/share/emacs/site-lisp/mu4e/mu4e.el' do
  it { should be_file }
end
