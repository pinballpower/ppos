[![GitHub contributors](https://img.shields.io/github/contributors/pinballpower/ppos.svg)](https://gitHub.com/pinballpower/ppos/graphs/contributors/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
# PPOS

Pinball Power OS is our version of a minimal Linux distribution optimized to be used to add 
functionality to pinball machines
The goal isn't to add as much functionality as possible, but to keep it small. Therefore, 
it is based on Buildroot and it's not possible to use package managers to add more 
software.

There is a robust update mechanism that will not overwrite the system, but switch between
the current and the new version (they run on different partitions). This is documented in more detail at [doc/updater.md](doc/updater.md).

## Contributions
We're looking forward to your contributions. Depending on functionality and code quality, we will decide if a contribution will be included in the base system or will be provided as a user-contributed module that users need to install by themselve.

