mu Cookbook
===========
Install and configures mu, a Maildir indexer.  
[![Cookbook Version](https://img.shields.io/cookbook/v/mu.svg)](https://community.opscode.com/cookbooks/mu) [![Build Status](https://travis-ci.org/sliim-cookbooks/mu.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/mu) 

Requirements
------------

#### Platforms:
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian 7
- Debian 8

Attributes
----------
#### mu::default
* `default["mu"]["emacs_package"]` = emascs package to install.
* `default["mu"]["packages"]` - package dependencies, depending of the platform.

#### mu::compile
* `default["mu"]["compile"]["build_dir"]` - Where mu archive will be extracted and builded
* `default["mu"]["compile"]["git-repository"]` - Git repository
* `default["mu"]["compile"]["git-reference"]` - Git reference
* `default["mu"]["compile"]["packages"]` - Required packages for compilation
* `default["mu"]["compile"]["flags"]` - Flags to pass to configure script

Usage
-----
#### mu::default
Just include `mu` in your node's `run_list` to install from packages:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mu]"
  ],
  "attributes": {
    "mu": {
      "emacs_package": "emacs23-nox",
      "packages": ["maildir-utils", "mu4e"]
    }
  }
}
```

#### mu::compile
Just include `mu::compile` in your node's `run_list` to install from sources:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mu:compile]"
  ],
  "attributes": {
    "mu": {
      "compile": {
        "build_dir": "/tmp/mu",
        "git-reference": "v0.9.11",
        "packages": ["libxapian-dev"],
        "flags": ["--with-guile-support=no"]
      }
    }
  }
}
```

#### Tests
This cookbook contains serverspec for test-kitchen, foodcritic and knife tests.

- First, install dependencies:  
`bundle install`  

- Install cookbook dependencies  
`berks install`

- To run all tests:  
`bundle exec rake`

- To run integration tests:
`bundle exec kitchen test`

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.


