// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logboard",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_13),
        .macCatalyst(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Logboard", targets: ["Logboard"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
             name: "Logboard",
             dependencies: [],
             exclude: [
                 "Info.plist"
             ]
        )
    ]
)
