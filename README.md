# Compiling the chihaya validator to Wasm

Provides an image that allows for easy building of the Wasm binaries in the [**chihaya**](https://github.com/ArtifactDB/chihaya.js) Javascript package.
This sets up the CMake directories and performs and initial compilation of all C++ files to Wasm,
which saves time during CI runs as we only have to recompile the files that changed.

Note that Node.js is pre-installed in this image as part of the Emscripten SDK but has been removed from the `$PATH`.
This is deliberate as it allows CI jobs to define a different Node.js version without having to worry about conflicts.
Developers wishing to use the pre-installed Node.js commands should run the following before working with **chihaya.js** code: 

```sh
NODEBIN=$(echo /emsdk/node/*/bin)
export PATH="${NODEBIN}:${PATH}"
```

The `/chihaya.js/` directory contains the **chihaya.js** code, along with the pre-built `build/` subdirectory containing an initial CMake build.
