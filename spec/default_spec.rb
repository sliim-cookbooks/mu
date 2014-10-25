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
  end

  context 'with overriden attributes' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
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
      expect(subject).to install_package('build-essential')
    end
  end

  context 'without packages' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['mu']['emacs_package'] = nil
        node.set['mu']['packages'] = nil
      end.converge described_recipe
    end

    it 'does include mu::compile recipe' do
      expect(subject).to include_recipe('mu::compile')
    end
  end
end
