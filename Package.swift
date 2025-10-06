// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logboard",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .macCatalyst(.v15),
        .macOS(.v11),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Logboard", targets: ["Logboard"])
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.4.5")
    ],
    targets: [
        .target(
            name: "Logboard",
            dependencies: [],
            )
    ]
)
