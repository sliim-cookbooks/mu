# -*- coding: utf-8 -*-
name 'mu'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache 2.0'
description 'Installs/Configures mu (maildir-utils)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

recipe 'default', 'Install mu from packages'
recipe 'compile', 'Build and install mu from sources'

supports 'debian', '>= 7.0'

source_url 'https://github.com/sliim-cookbooks/glances' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/glances/issues' if
  respond_to?(:issues_url)
