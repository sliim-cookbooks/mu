mu CHANGELOG
============

This file is used to list changes made in each version of the mu cookbook.

0.2.0
-----
- Added `compile` recipe for installation from source
- `default` recipe install from packages if available,
  else it attempt to include `compile` recipe
- Added `flags` attribute, a list of flags to pass to configure script

O.1.2
-----
- Fixed compilation error
- Added Chefspec
- Code improvements

0.1.1
-----
- Use official opscode box for test-kitchen

0.1.0
-----
- Initial release of mu
