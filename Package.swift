// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logboard",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .macCatalyst(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Logboard", targets: ["Logboard"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
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
