# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'mu::compile' do
  context 'on debian platform' do
    let(:subject) do
      ChefSpec::Runner.new(
        platform: 'debian',
        version: '8.0').converge(described_recipe)
    end

    ['libgmime-2.6-dev', 'libxapian-dev', 'guile-2.0-dev', 'html2text',
     'xdg-utils', 'guile-2.0-dev', 'html2text', 'xdg-utils', 'g++',
     'libgtk2.0-dev', 'autoconf', 'texinfo', 'git-core'].each do |pkg|
      it "installs package[#{pkg}]" do
        expect(subject).to install_package(pkg)
      end
    end
  end

  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'syncs git[/opt/mu]' do
    expect(subject).to sync_git('/opt/mu')
      .with(repository: 'https://github.com/djcb/mu.git',
            reference: 'v0.9.13')
  end

  it 'runs execute[autoreconf -i]' do
    expect(subject).to run_execute('autoreconf -i')
      .with(cwd: '/opt/mu')
  end

  it 'runs execute[build-mu]' do
    expect(subject).to run_execute('build-mu')
      .with(cwd: '/opt/mu',
            command: './configure && make')
  end

  it 'runs execute[make install]' do
    expect(subject).to run_execute('make install').with(cwd: '/opt/mu')
  end

  it 'runs execute[make-install-mu4e]' do
    expect(subject).to run_execute('make-install-mu4e')
      .with(cwd: '/opt/mu/mu4e',
            command: 'make install')
  end

  context 'with flags' do
    let(:subject) do
      ChefSpec::Runner.new do |node|
        node.set['mu']['compile']['flags'] = ['--with-guile-support=no']
      end.converge described_recipe
    end

    it 'runs execute[build-mu]' do
      expect(subject).to run_execute('build-mu')
        .with(cwd: '/opt/mu',
              command: './configure --with-guile-support=no&& make')
    end
  end
end
