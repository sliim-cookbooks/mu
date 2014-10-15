# -*- coding: utf-8 -*-
#
# Cookbook Name:: mu
# Spec:: default
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

require_relative 'spec_helper'

describe 'mu::default' do
  context 'with default attributes' do

    let(:subject) { ChefSpec::Runner.new.converge described_recipe }

    it 'does include apt recipe' do
      expect(subject).to include_recipe('apt')
    end

    it 'does install emacs package' do
      expect(subject).to install_package('emacs23-nox')
    end

    it 'does download mu package' do
      expect(subject).to create_remote_file('/var/chef/cache/mu.tar.gz')
        .with(source: 'http://mu0.googlecode.com/files/mu-0.9.8.5.tar.gz',
              mode: '0644')
    end

    it 'does create build directory' do
      expect(subject).to create_directory('/opt/mu')
        .with(owner: 'root',
              group: 'root',
              mode: '0755',
              recursive: true)
    end

    it 'does untar mu package' do
      expect(subject).to run_execute('untar')
        .with(cwd: '/opt/mu',
              command: format('%s %s %s',
                              'tar',
                              '--strip-components 1 -xzf',
                              '/var/chef/cache/mu.tar.gz'))
    end

    it 'does build mu' do
      expect(subject).to run_execute('configure and make')
        .with(cwd: '/opt/mu',
              command: './configure && make')
    end

    it 'does install mu' do
      expect(subject).to run_execute('install mu')
        .with(cwd: '/opt/mu',
              command: 'make install')
    end
  end

  context 'with overriden attributes' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['mu']['build_dir'] = '/opt/mu-build'
        node.set['mu']['version'] = '1.3.3.7'
        node.set['mu']['emacs_package'] = 'emacs'
        node.set['mu']['packages'] = ['build-essential']
      end.converge described_recipe
    end

    it 'does include apt recipe' do
      expect(subject).to include_recipe('apt')
    end

    it 'does install emacs package' do
      expect(subject).to install_package('emacs')
    end

    it 'does install build-essential package' do
      expect(subject).to upgrade_package('build-essential')
    end

    it 'does download mu package' do
      expect(subject).to create_remote_file('/var/chef/cache/mu.tar.gz')
        .with(source: 'http://mu0.googlecode.com/files/mu-1.3.3.7.tar.gz',
              mode: '0644')
    end

    it 'does create build directory' do
      expect(subject).to create_directory('/opt/mu-build')
        .with(owner: 'root',
              group: 'root',
              mode: '0755',
              recursive: true)
    end

    it 'does untar mu package' do
      expect(subject).to run_execute('untar')
        .with(cwd: '/opt/mu-build',
              command: format('%s %s %s',
                              'tar',
                              '--strip-components 1 -xzf',
                              '/var/chef/cache/mu.tar.gz'))
    end

    it 'does build mu' do
      expect(subject).to run_execute('configure and make')
        .with(cwd: '/opt/mu-build',
              command: './configure && make')
    end

    it 'does install mu' do
      expect(subject).to run_execute('install mu')
        .with(cwd: '/opt/mu-build',
              command: 'make install')
    end
  end
end
