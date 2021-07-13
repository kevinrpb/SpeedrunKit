// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SpeedrunKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .macCatalyst(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(
            name: "SpeedrunKit",
            targets: ["SpeedrunKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SpeedrunKit",
            dependencies: []),
        .testTarget(
            name: "SpeedrunKitTests",
            dependencies: ["SpeedrunKit"]),
    ]
)
