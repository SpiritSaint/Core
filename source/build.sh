#/bin/bash

# Compile
cmake -S . -B . -DCMAKE_BUILD_TYPE=Release
cmake --install . --strip
cmake --build . --config Release

# Finish
echo "Compiled ..."
