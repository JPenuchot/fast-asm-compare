# Compare

Makes deep code inspection easier.

This sub-project was made to easily compare two programs' ASM code using objdump and/or [Intel IACA](https://software.intel.com/en-us/articles/intel-architecture-code-analyzer).

The assembly dump doesn't require anything except objdump that should already be installed on your computer, however if you want to inspect code using IACA you must [download IACA from Intel's website](https://software.intel.com/en-us/articles/intel-architecture-code-analyzer) and unzip ```iaca-lin64``` in the ```ext``` folder at the project's root.

## How does it work ?

Add your sources in a ```src__[NAME]``` folder and the build script will take care of the rest, ie :

- Build as ```bin/[NAME]```
- Disassembly as ```bin/[NAME].asm```
- IACA inspection as ```bin/[NAME].iaca```
