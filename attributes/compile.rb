# -*- coding: utf-8 -*-
#
# Cookbook Name:: mu
# Attributes:: compile
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

default['mu']['compile']['build_dir'] = '/opt/mu'
default['mu']['compile']['git-repository'] = 'https://github.com/djcb/mu.git'
default['mu']['compile']['git-reference'] = 'v0.9.13'
default['mu']['compile']['packages'] = []
default['mu']['compile']['flags'] = []

case node['platform']
when 'debian'
  default['mu']['compile']['packages'] = ['libgmime-2.6-dev', 'libxapian-dev',
                                          'guile-2.0-dev', 'html2text',
                                          'xdg-utils', 'guile-2.0-dev',
                                          'html2text', 'xdg-utils', 'g++',
                                          'libgtk2.0-dev', 'autoconf',
                                          'texinfo', 'git-core']
end
