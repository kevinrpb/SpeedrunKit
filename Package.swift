// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SpeedrunKit",
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
