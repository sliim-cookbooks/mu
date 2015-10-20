# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'mu::default' do
  context 'on debian platform' do
    let(:subject) do
      ChefSpec::Runner.new(platform: 'debian', version: '8.0')
        .converge described_recipe
    end

    it 'installs package[maildir-utils]' do
      expect(subject).to install_package('maildir-utils')
    end

    it 'installs package[mu4e]' do
      expect(subject).to install_package('mu4e')
    end
  end

  context 'with emacs package' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['mu']['emacs_package'] = 'emacs'
      end.converge described_recipe
    end

    it 'installs package[emacs]' do
      expect(subject).to install_package('emacs')
    end
  end

  context 'without mu packages' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['mu']['packages'] = []
      end.converge described_recipe
    end

    it 'includes recipe[mu::compile]' do
      expect(subject).to include_recipe('mu::compile')
    end
  end
end
