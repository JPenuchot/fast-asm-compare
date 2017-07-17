# Compare

Makes deep code inspection easier.

This sub-project was made to easily compare two programs' ASM code using objdump and/or [Intel IACA](https://software.intel.com/en-us/articles/intel-architecture-code-analyzer).

The assembly dump doesn't require anything except objdump that should already be installed on your computer, however if you want to inspect code using IACA you must [download IACA from Intel's website](https://software.intel.com/en-us/articles/intel-architecture-code-analyzer) and unzip ```iaca-lin64``` in the ```ext``` folder at the project's root.

Graphs are also generated and can be converted into SVG and/or PDF using `dot` to visualize critical paths.

## How does it work ?

Add your sources in a ```src__[NAME]``` folder and the build script will take care of the rest, ie :

- Build as ```bin/[NAME]```
- Disassembly as ```bin/[NAME].asm```
- IACA inspection as ```bin/[NAME].iaca```

## Example

You can see it at work on my [`boost.simd_playground`](https://github.com/jpenuchot/boost.simd_playground) project where I extensively use it to compare code generated using boost.simd and custom assembly code or other SIMD optimized (or not) C++ code (OpenBLAS, GLM and "dumb" C++ versions that are just written as clean as possible).

`fast-asm-compare` is directly cloned into the main project folder then all the "inspection projects" are symlinked from the `examples/compare` folder, then external libraries are also linked from the `ext` folder.

The only thing you might have to do is to add/link IACA into `fast-asm-compare`'s `ext` folder.