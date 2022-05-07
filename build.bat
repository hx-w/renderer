rmdir /s/q .\build
cmake -S . -B build
cmake --build ./build --config Debug --target xrender -j 10 --
move build\Debug\xrender.exe .\