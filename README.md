mu Cookbook
===========
Install and configures mu, a Maildir indexer  

Requirements
------------

#### Cookbooks
- `apt` - `http://community.opscode.com/cookbooks/apt`

#### Platforms:
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian wheezy

Attributes
----------
#### mu::default
* `default["mu"]["build_dir"]` - Where mu archive will be extracted and builded
* `default["mu"]["version"]` - mu version to install
* `default["mu"]["emacs_package"]` = emascs package to install. If null, mu recipe will include emacs24 cookbook
* `default["mu"]["packages"]` - package dependencies, depending of the platform.

Usage
-----
#### mu::default
Just include `mu` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mu]"
  ]
}
```

#### Tests

This cookbook contains serverspec integration tests, foodcritic and knife tests.

- First, install dependencies:  
`bundle install`  

- Install cookbook dependencies  
`berks install`

- To run all tests:  
`bundle exec strainer test`

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

License: All rights reserved

