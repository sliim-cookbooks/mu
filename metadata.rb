# -*- coding: utf-8 -*-

name             'mu'
maintainer       'Sliim'
maintainer_email 'sliim@mailoo.org'
license          'Apache 2.0'
description      'Installs/Configures mu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

recipe 'default', 'Build and install mu from source'

depends 'apt'
supports 'debian'
