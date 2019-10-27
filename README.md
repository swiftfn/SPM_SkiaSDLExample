Example about building Skia C++ programs with Swift Package Manager

See:
* https://github.com/google/skia/blob/master/example/SkiaSDLExample.cpp
* https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md
* https://github.com/apple/swift-package-manager/blob/master/Documentation/PackageDescription.md

See also:
* http://ankit.im/swift/2016/05/21/creating-objc-cpp-packages-with-swift-package-manager/
* https://github.com/elegantchaos/CSkia

## Build Skia

See:
* https://skia.org/user/download
* https://skia.org/user/build
* https://stackoverflow.com/questions/50228652/how-to-compile-skia-on-windows
* https://github.com/flutter/engine/blob/master/tools/gn

Build static libraries:

```sh
bin/gn gen out/mac --args="is_debug=false is_official_build=true \
skia_use_system_expat=false skia_use_system_libjpeg_turbo=false \
skia_use_system_libpng=false skia_use_system_libwebp=false \
skia_use_system_zlib=false skia_use_system_icu=false \
skia_use_system_harfbuzz=false"

ninja -C out/mac
```

## Build this example

Create symlinks to the built Skia above:

```sh
cd Sources/cpp
mkdir skia
cd skia
ln -s /path/to/skia/include
ln -s /path/to/skia/src
ln -s /path/to/skia/out
```

Build:

```sh
swift build
swift build -c release
```

Run:

```sh
.build/debug/cpp
.build/release/cpp
```

Equivalent build command with gcc:

```sh
export SKIA_SRC=~/src/skia

gcc main.cpp \
-std=c++14 -lstdc++ \
`pkg-config --cflags --libs SDL2` \
-I${SKIA_SRC} -L${SKIA_SRC}/out/mac -lskia \
-framework CoreFoundation -framework CoreGraphics \
-framework CoreText -framework CoreServices \
-framework OpenGL
```
