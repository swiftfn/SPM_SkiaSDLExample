// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SPM_SkiaSDLExample",
    dependencies: [
    ],
    targets: [
        .target(
            name: "cpp",
            dependencies: [],
            cxxSettings: [
                .headerSearchPath("skia"),
                .unsafeFlags(["-I/usr/local/include/SDL2"])
            ],
            linkerSettings: [
                .linkedLibrary("skia"),
                .linkedLibrary("SDL2"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreText"),
                .linkedFramework("CoreServices"),
                .linkedFramework("OpenGL"),
                .unsafeFlags(["-LSources/cpp/skia/out/mac", "-L/usr/local/lib"])
            ]),
        .target(
            name: "swift",
            dependencies: [])
    ],
    cxxLanguageStandard: .cxx14
)
