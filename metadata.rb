# -*- coding: utf-8 -*-

name             'mu'
maintainer       'Sliim'
maintainer_email 'sliim@mailoo.org'
license          'Apache 2.0'
description      'Installs/Configures mu (maildir-utils)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe 'default', 'Install mu from packages'
recipe 'compile', 'Build and install mu from sources'

depends 'apt'
supports 'debian'
