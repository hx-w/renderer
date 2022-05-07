rm -rf build/
cmake -S . -B build
cmake --build ./build --config Debug --target xrender -j 10 --
